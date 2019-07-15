class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  # Usage:
  # Inherited class should define 2 methods `initialize`, `call`.
  #
  # class SampleService < ApplicationService
  #   def initialize(*args)
  #   end

  #   def call
  #   end
  # end
  #
  # SampleService.call(*args)
end
