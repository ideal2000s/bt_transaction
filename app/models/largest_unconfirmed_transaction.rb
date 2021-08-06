# frozen_string_literal: true

class LargestUnconfirmedTransaction < ApplicationRecord
  validates :hash_value,
            presence: true,
            uniqueness: true
end
