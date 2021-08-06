# frozen_string_literal: true

module Api
  module V1
    class LargestUnconfirmedTransactionsController < ApplicationController
      def index
        authorize_action
        largest_unconfirmed_transaction = LargestUnconfirmedTransaction.last
        render status: :ok, json: largest_unconfirmed_transaction, serializer: SimpleTransactionSerializer, root: false
      end

      private

      def policy_class
        LargestUnconfirmedTransactionPolicy
      end

      def authorize_action(record = LargestUnconfirmedTransaction)
        authorize(record, "#{action_name}?", policy_class: policy_class)
      end
    end
  end
end
