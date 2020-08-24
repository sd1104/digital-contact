class UsersController < ApplicationController
  before_action :authenticate_school!

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_control_schools_path
    else
      redirect_to users_control_schools_path
    end
  end

end
