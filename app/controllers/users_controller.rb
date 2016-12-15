class UsersController < ApplicationController
  before_action :set_currentuser, only: [:edit, :update,:update_password, :update_user, :update_picture]
  before_action :set_user, only: [:view]
  before_action :authenticate_user!, except: [ :view ]
  before_action :question_for_user, only: [:view]

  def edit
    @questionslasts = Question.recent
    @questionslastsmine = Question.mine.recent_min
  end

  def view

  end

  def update_password

    respond_to do |format|
      if @user.update(user_params)
        # Sign in the user by passing validation in case their password changed
        sign_in @user, :bypass => true
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'Password was successfully updated.'
         }

        format.json {
          render json: edit_user_registration_path,
          status: :created,
          location: @user
          }

      else
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'Error User password.'
         }

        format.json {
          render json: @user.errors,
          status: :unprocessable_entity,
          location: @user
          }

      end
    end
  end

  def update_user
    respond_to do |format|

      if @user.update(user)
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'User successfully updated.'
         }

        format.json {
          render json: edit_user_registration_path,
          status: :created,
          location: @user
          }
      else
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'Error User successfully updated.'
         }

        format.json {
          render json: @user.errors,
          status: :unprocessable_entity,
          location: @user
          }

      end

    end

  end

  def update_picture

    respond_to do |format|

      if @user.update(user_picture)
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'User successfully updated.'
         }

        format.json {
          render json: edit_user_registration_path,
          status: :created,
          location: @user
          }
      else
        format.html {
          redirect_to edit_user_registration_path,
          notice: 'Error User successfully updated.'
         }

        format.json {
          render json: @user.errors,
          status: :unprocessable_entity,
          location: @user
          }

      end

    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_picture
    params.require(:user).permit(:picture)
  end

  def user
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:first_name, :last_name, :sex, :email,
    :occupation, :biography, :twitter, :linkedin, :github)

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    @user_general = User.find(params[:id])
  end

  def set_currentuser
    @user = current_user
    @user_general = current_user
  end

  def question_for_user
    @questionslasts = Question.by_user(params[:id]).recent
    @questionslastsmine = Question.recent.mine
  end

end
