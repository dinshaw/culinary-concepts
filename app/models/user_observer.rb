class UserObserver < ActiveRecord::Observer
  def after_create(user)
  end

  def after_save(user)
    # UserMailer.deliver_signup_notification(user) if user.pending?
    UserMailer.deliver_forgot_password(user) if user.recently_forgot_password?
    UserMailer.deliver_reset_password(user) if user.recently_reset_password?
  end
end

