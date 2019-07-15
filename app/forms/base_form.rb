class BaseForm
  include ActiveModel::Model

  class << self
    def i18n_scope
      :form
    end
  end
end
