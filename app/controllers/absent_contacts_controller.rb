class AbsentContactsController < ApplicationController
  before_action :set_foreign_instance
  
  def index
    @absent_contact = AbsentContact.new
  end

  def create
    AbsentContact.create(absent_contact_params)
    redirect_to room_absent_contacts_path(@room)
  end
  
  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

  def absent_contact_params
    params.require(:absent_contact).permit(:absent_at, :kind, :reason, :after_contact).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
