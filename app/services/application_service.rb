class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  # Inherited class should define 2 methods:
  #
  #   def initialize(*args)
  #   end

  #   def call
  #   end
end
