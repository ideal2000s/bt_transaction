# frozen_string_literal: true

module Interactor
  module ClassMethods
    def method_missing(m, *args, &block)
      service = new

      if service.respond_to?(m)
        service.public_send(m, *args, &block)
        service
      else
        raise ArgumentError.new("Method `#{m}` doesn't exist.")
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize
    @errors = []
    @error_hash = {}
  end

  def errors
    @errors
  end

  def error_hash
    @error_hash
  end

  def add_error(error)
    @errors << error
  end

  def add_error_value(key, value)
    @error_hash[key] = value
  end

  def failed?
    @errors.any?
  end

  def success?
    @errors.empty?
  end
end
