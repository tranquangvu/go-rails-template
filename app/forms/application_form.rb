class ApplicationForm
  include ActiveModel::Model

  class << self
    def i18n_scope
      :form
    end
  end

  # Usage:
  # Inherited class should define 2 methods `initialize`, `submit`.
  #
  # class UserRegistrationForm
  #   def initialize(params = {})
  #     @user = User.new
  #     super(params)
  #
  #     # ...
  #   end
  #
  #   def submit
  #     return false if invalid?
  #
  #     # ...
  #   end
  # end
end
