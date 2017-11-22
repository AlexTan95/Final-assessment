require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
          it { is_expected.to validate_presence_of(:first_name)}
          it { is_expected.to validate_presence_of(:last_name)}
          it { is_expected.to validate_presence_of(:email)}
          it { is_expected.to validate_presence_of(:password)}
          it do
            should validate_length_of(:password).
            is_at_least(7).is_at_most(20)
        end
    end

    describe 'associations' do
        it { is_expected.to have_many(:votes) }
        it { is_expected.to have_many(:projects) }
    end
end
