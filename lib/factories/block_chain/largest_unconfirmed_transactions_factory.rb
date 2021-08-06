# frozen_string_literal: true

module BlockChain
  class LargestUnconfirmedTransactionsFactory
    include Interactor

    def create(block_cypher_transaction)
      transaction_params = get_transaction_params(block_cypher_transaction)
      new = LargestUnconfirmedTransaction.new(transaction_params)
      ActiveRecord::Base.transaction do
        new.save!
      rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => e
        add_error(e.message)
        raise ActiveRecord::Rollback
      end
    end

    def delete_before(date)
      LargestUnconfirmedTransaction.where('largest_unconfirmed_transactions.created_at < ?', date).destroy_all
    end

    private

    def get_transaction_params(block_cypher_transaction)
      transaction_params = block_cypher_transaction.slice('hash', 'total', 'fees', 'inputs', 'outputs').transform_keys(&:to_sym)
      transaction_params[:hash_value] = transaction_params.delete :hash
      transaction_params
    end
  end
end
