# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :create_teacher]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  
  def new2
    @rooms = Room.includes(:school).where(school_id: current_user.school_id)
    @user = User.find(current_user.id)
  end

  def room_select
    @user = User.find(current_user.id)
    if @user.update(sign_up_params)
      sign_in(:user, @user)
      redirect_to rooms_path
    else
      render :new2
    end
  end

  def new_teacher
    @rooms = Room.includes(:school).where(school_id: current_school.id)
    if @rooms
      @teacher = User.new
    else
      redirect_to schools_path
    end
  end

  def create_teacher
    @teacher = User.new(sign_up_params)
    if @teacher.save
      redirect_to schools_path
    else
      render :new_teacher
    end
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
