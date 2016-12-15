class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user
  before_filter :set_time_zone
  around_filter :user_time_zone, :if => :current_user

  def set_current_user
    Question.current_user = current_user
    Answer.current_user = current_user
    Label.current_user = current_user
    QuestionLabel.current_user = current_user

  end

  def current_user
    user = super || Guest.new
    user.decorate
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  protected


  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email,
                            :password, :password_confirmation, :remember_me,
                            :first_name, :last_name, :sex, :biography,
                            :occupation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email,
                                                  :password, :remember_me) }

  end

  def set_time_zone
    Time.zone = current_user.time_zone if current_user
  end


end
