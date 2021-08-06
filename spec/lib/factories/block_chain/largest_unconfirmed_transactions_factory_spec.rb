# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

module BlockChain
  RSpec.describe LargestUnconfirmedTransactionsFactory do
    before do
      described_class.create(block_cypher_transaction_one)
    end

    let(:block_cypher_transaction_one) do
      JSON.parse(eval(File.read('./spec/data/block_chain/transaction_1.json')).to_json)
    end
    let(:block_cypher_transaction_two) do
      JSON.parse(eval(File.read('./spec/data/block_chain/transaction_2.json')).to_json)
    end

    describe '#create' do
      context 'with a updated block cypher transaction' do
        it 'successes the creation' do
          expect do
            result = described_class.create(block_cypher_transaction_two)
            expect(result).to be_success
          end.to change(LargestUnconfirmedTransaction, :count).by(1)
        end
      end

      context 'with a same block cypher transaction' do
        it 'fails the creation' do
          expect do
            result = described_class.create(block_cypher_transaction_one)
            expect(result).to be_failed
          end.to change(LargestUnconfirmedTransaction, :count).by(0)
        end
      end
    end

    describe '#delete_before' do
      it 'deletes transactions before the given date' do
        expect(LargestUnconfirmedTransaction.count).not_to be_zero
        described_class.delete_before(Time.now.utc + 1.second)
        expect(LargestUnconfirmedTransaction.count).to be_zero
      end
    end
  end
end
