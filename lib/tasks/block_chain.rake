# frozen_string_literal: true

namespace :block_chain do
  desc 'Get largest unconfirmed transaction'
  task import_largest_unconfirmed_transaction: :environment do |t, args|
    block_cypher = BlockCypher::Api.new
    unconfirmed_transactions = block_cypher.blockchain_unconfirmed_tx
    largest_transaction = unconfirmed_transactions.max { |a, b| a['total'].to_i <=> b['total'].to_i }
    BlockChain::LargestUnconfirmedTransactionsFactory.create(largest_transaction)
  end

  desc 'Clear largest unconfirmed transactions before than created one day ago'
  task clear_largest_unconfirmed_transaction: :environment do |t, args|
    BlockChain::LargestUnconfirmedTransactionsFactory.delete_before(Time.now.utc - 1.day)
  end
end
