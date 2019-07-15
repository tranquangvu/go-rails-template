class ApplicationForm
  include ActiveModel::Model

  class << self
    def i18n_scope
      :form
    end
  end

  # Inherited class should define 2 methods like below:
  #
  #   def initialize(params = {})
  #     @model = Model.new
  #     super(params)
  #
  #     # other actions here...
  #   end

  #   def submit
  #     return false if invalid?
  #     # other actions here...
  #   end
end
