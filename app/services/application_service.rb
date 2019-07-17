class ApplicationService
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError, "You must define `call` as instance method in #{self.class.name} class"
  end

  # Usage:
  # Inherited class should define 2 methods `initialize`, `call`.
  #
  # class SampleService < ApplicationService
  #   def initialize(*args)
  #   end
  #
  #   def call
  #   end
  # end
  #
  # SampleService.call(*args)
end
