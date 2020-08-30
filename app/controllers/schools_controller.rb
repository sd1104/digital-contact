class SchoolsController < ApplicationController
  before_action :authenticate_school!
  def index
  end

  def users_control
    @rooms = Room.all
  end
end
