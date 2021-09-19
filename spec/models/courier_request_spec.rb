require 'rails_helper'

RSpec.describe CourierRequest, type: :model do
  describe 'db_columns' do
    it { should have_db_column(:weight).of_type(:integer)  }
    it { should have_db_column(:cost).of_type(:float)  }
    it { should have_db_column(:payment_mode).of_type(:integer)  }
    it { should have_db_column(:status).of_type(:integer)  }

    it { should have_db_column(:sender_fullname).of_type(:string)  }
    it { should have_db_column(:sender_address).of_type(:text)  }
    it { should have_db_column(:sender_phone).of_type(:string)  }
    it { should have_db_column(:sender_pincode).of_type(:string)  }

    it { should have_db_column(:receiver_fullname).of_type(:string)  }
    it { should have_db_column(:receiver_address).of_type(:text)  }
    it { should have_db_column(:receiver_phone).of_type(:string)  }
    it { should have_db_column(:receiver_pincode).of_type(:string)  }

    it { should have_db_column(:tracking_number).of_type(:string)  }

    it { should have_db_column(:created_at).of_type(:datetime)  }
    it { should have_db_column(:updated_at).of_type(:datetime)  }

  end

  describe 'validations' do
    it { should validate_presence_of(:weight)  }
    it { should validate_presence_of(:cost)  }
  end
end
