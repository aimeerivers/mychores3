class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user, :current_user_session, :current_person, :signed_in?

  protected

  def sign_in_required
    if !signed_in?
      flash[:error] = 'Please sign in first.'
      redirect_to sign_in_path
    end
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def current_person
    current_user.person
  end

  def signed_in?
    current_user || false
  end
end
