require 'rails_helper'

RSpec.describe CourierRequest, type: :model do
  describe 'db_columns' do
    it { should have_db_column(:weight) }
  end
end
