# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  http_basic_authenticate_with name: 'james', password: 'test1234'

  def current_user
    'james' # imagine that the session user is james
  end
end
