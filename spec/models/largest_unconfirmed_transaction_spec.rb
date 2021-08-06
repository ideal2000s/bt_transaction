# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe LargestUnconfirmedTransaction, type: :model do
  describe 'Validation' do
    subject { LargestUnconfirmedTransaction.create(hash_value: Faker::Lorem.characters(10)) }

    it { is_expected.to validate_presence_of(:hash_value) }
    it { is_expected.to validate_uniqueness_of(:hash_value) }
  end
end
