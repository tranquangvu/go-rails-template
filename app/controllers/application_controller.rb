class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    redirect_to user_not_authorized_path, alert: t("#{exception.policy.class.to_s.underscore.tr('/', '.')}.#{exception.query}", scope: 'pundit', default: :default)
  end

  def user_not_authorized_path
    root_path
  end
end
