require 'rails_helper'

RSpec.describe CourierRequest, type: :model do
  context 'db_columns' do
    it { should have_db_column(:weight).of_type(:integer)  }
    it { should have_db_column(:cost).of_type(:float)  }
    it { should have_db_column(:payment_mode).of_type(:integer)  }
    it { should have_db_column(:status).of_type(:integer)  }

    it { should have_db_column(:sender_fullname).of_type(:string)  }
    it { should have_db_column(:sender_address).of_type(:text)  }
    it { should have_db_column(:sender_phone).of_type(:string)  }
    it { should have_db_column(:sender_pincode).of_type(:string)  }
    it { should have_db_column(:sender_email).of_type(:string)  }

    it { should have_db_column(:receiver_fullname).of_type(:string)  }
    it { should have_db_column(:receiver_address).of_type(:text)  }
    it { should have_db_column(:receiver_phone).of_type(:string)  }
    it { should have_db_column(:receiver_pincode).of_type(:string)  }
    it { should have_db_column(:receiver_email).of_type(:string)  }

    it { should have_db_column(:tracking_number).of_type(:string)  }

    it { should have_db_column(:user_id).of_type(:integer)  }

    it { should have_db_column(:created_at).of_type(:datetime)  }
    it { should have_db_column(:updated_at).of_type(:datetime)  }
  end

  context 'validations' do
    subject { FactoryBot.build(:courier_request) }

    (CourierRequest.attribute_names.map(&:to_sym) - [:id, :created_at, :updated_at, :tracking_number, :sender_email, :receiver_email]).each do |cr_attr|
      it { should validate_presence_of(cr_attr) }
    end

    # it { should validate_uniqueness_of(:tracking_number) }
    it { should validate_numericality_of(:cost).is_greater_than(0) }
    it { should validate_numericality_of(:weight).is_greater_than(0) }

    it { should define_enum_for(:status).with_values(CourierRequest.statuses.keys).backed_by_column_of_type(:integer) }
    it { should define_enum_for(:service_type).with_values(CourierRequest.service_types.keys).backed_by_column_of_type(:integer) }
    it { should define_enum_for(:payment_mode).with_values(CourierRequest.payment_modes.keys).backed_by_column_of_type(:integer) }

    describe 'tracking_number' do
      let(:cr) { FactoryBot.create(:courier_request) }

      it 'should be readonly' do
        expect {
          cr.update_attribute(:tracking_number, 'trckn')
        }.to raise_error(ActiveRecord::ActiveRecordError, 'tracking_number is marked as readonly')
      end

      it 'should set a tracking number on validation on create' do
        cr = FactoryBot.build(:courier_request, tracking_number: nil)
        expect(cr.tracking_number).to be_nil

        cr.valid?
        expect(cr.tracking_number).not_to be_nil
      end
    end
  end

  context '#after_commit' do
    it 'deliver email to both sender and receiver' do
      user = FactoryBot.create(:user)
      courier_request_with_sender = FactoryBot.build(:courier_request, sender_email: 'sender@example.com', user: user)
      expect { courier_request_with_sender.save! }.to change { ActionMailer::Base.deliveries.count }.by(1)

      courier_request_with_receiver = FactoryBot.build(:courier_request, receiver_email: 'receiver@example.com', user: user)
      expect { courier_request_with_receiver.save! }.to change { ActionMailer::Base.deliveries.count }.by(1)

      courier_request = FactoryBot.build(:courier_request, sender_email: 'sender@example.com', receiver_email: 'receiver@example.com', user: user)
      expect { courier_request.save! }.to change { ActionMailer::Base.deliveries.count }.by(2)
    end
  end


end
