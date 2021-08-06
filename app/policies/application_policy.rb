# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(current_user, record = nil)
    @user = current_user
    @record = record
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
