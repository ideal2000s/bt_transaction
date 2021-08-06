# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

module Api
  module V1
    RSpec.describe LargestUnconfirmedTransactionsController do
      before do
        LargestUnconfirmedTransaction.create!(hash_value: Faker::Lorem.characters(10))
      end

      describe '#largest_unconfirmed_transaction' do
        context 'without the authorization' do
          it 'returns 401' do
            get :index, format: :json
            expect(response).to have_http_status(:unauthorized)
          end
        end

        context 'with a success authorization' do
          before do
            allow(subject).to receive(:http_basic_authenticate_or_request_with).with(anything).and_return true
          end

          it 'returns 200' do
            get :index, format: :json
            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to be_present
          end
        end
      end
    end
  end
end
