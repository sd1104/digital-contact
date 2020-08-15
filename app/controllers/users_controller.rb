class UsersController < ApplicationController
  before_action :authenticate_school!

  def index
  end
end
