# frozen_string_literal: true

class LargestUnconfirmedTransactionPolicy < ApplicationPolicy
  def index?
    true # imagine that the user has permissions
  end
end
