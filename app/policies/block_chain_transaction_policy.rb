# frozen_string_literal: true

class BlockChainTransactionPolicy < ApplicationPolicy
  def largest_unconfirmed_transaction?
    true # imagine that the user has permissions
  end
end
