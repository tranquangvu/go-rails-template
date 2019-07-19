class ApplicationService
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError, "You must define `call` as instance method in #{self.class.name} class"
  end

  # Usage:
  #
  # class ActivateUserService < ApplicationService
  #   attr_reader :user
  #
  #   def initialize(user)
  #     @user = user
  #   end
  #
  #   def call
  #     user.activate!
  #     NotificationsMailer.user_activation_notification(user).deliver_later
  #     user
  #   end
  # end
  #
  # user = User.find(1)
  # ActivateUserService.call(user)
end
