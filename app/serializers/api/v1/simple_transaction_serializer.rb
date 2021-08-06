# frozen_string_literal: true

module Api
  module V1
    class SimpleTransactionSerializer < ActiveModel::Serializer
      attributes :id, :hash_value, :inputs, :outputs
    end
  end
end
