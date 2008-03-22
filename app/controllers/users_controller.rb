class UsersController < ApplicationController
  before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]

  skip_before_filter :login_required, :only => [:forgot_password, :reset_password]
  
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    if @user.save
      @user.register!
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate!
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end

  def forgot_password
    return unless request.post?
    if @user = User.find_for_forget(params[:email])
      @user.forgot_password
      @user.save
      redirect_back_or_default(root_path)
      flash[:notice] = "A password reset link has been sent to your email address" 
    else
      flash[:notice] = "Could not find a user with that email address" 
    end
  end

  def reset_password
    @user = User.find_by_password_reset_code(params[:password_reset_code]) if params[:password_reset_code]
    if @user
      self.current_user = @user
      redirect_to(:action => 'change_password')
    else
      logger.error "Invalid Password Reset Code entered." 
      flash[:notice] = "Invalid Password Reset Code entered. Please check your Code and try again."
    end
  end

  def change_password
    return unless request.post?
    if (params[:password] == params[:password_confirmation])
      current_user.password_confirmation = params[:password_confirmation]
      current_user.password = params[:password]
      current_user.reset_password
      flash[:notice] = current_user.save ? "Password reset" : "Password not reset" 
      redirect_back_or_default(root_path)
    else
      flash[:notice] = "Password mismatch" 
    end  
  end

  protected
  def find_user
    @user = User.find(params[:id])
  end

end
