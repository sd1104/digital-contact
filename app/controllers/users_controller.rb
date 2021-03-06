class UsersController < ApplicationController
  before_action :authenticate_school!

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to room_show_rooms_path
    else
      redirect_to schools_path
    end
  end

end
