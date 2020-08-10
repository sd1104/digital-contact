class UsersController < ApplicationController
  before_action :authenticate_school!
end
