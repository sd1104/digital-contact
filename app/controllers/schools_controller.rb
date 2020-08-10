class SchoolsController < ApplicationController
  before_action :authenticate_school!
  def index
  end
end
