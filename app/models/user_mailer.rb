class UserMailer < ActionMailer::Base
  include ActionController::UrlWriter
  default_url_options[:host] = PRIMARY_DOMAIN
  
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'  
    @body[:url]  = activate_path(user.activation_code, :only_path => false)
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://localhost:3000/"
  end
  
  def forgot_password(user)
    setup_email(user)
    @subject    += 'You have requested to change your password'
    @body[:url]  = "http://localhost:3000/reset_password/#{user.password_reset_code}"
  end
 
  def reset_password(user)
    setup_email(user)
    @subject    += 'Your password has been reset.'
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "mail@yourapplication.com"
      @subject     = "YourApplication - "
      @sent_on     = Time.now
      @body[:user] = user
    end
end

