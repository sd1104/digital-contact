class AbsentContactsController < ApplicationController
  before_action :set_foreign_instance
  
  def index
    @absent_contacts_for_parent = AbsentContact.includes(:room, :user).where.not(absent_at: Date.today).where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
    @absent_contacts_for_teacher = AbsentContact.includes(:room, :user).where.not(absent_at: Date.today).where(room_id: (params[:room_id])).order('absent_at DESC')
    @absent_contact = AbsentContact.new
    @today_absent_contact_for_parent = AbsentContact.includes(:room, :user).where(absent_at: Date.today, user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
    @today_absent_contact_for_teacher = AbsentContact.includes(:room, :user).where(absent_at: Date.today, room_id: (params[:room_id])).order('absent_at DESC')
  end

  def create
    AbsentContact.create(absent_contact_params)
    redirect_to room_absent_contacts_path(@room)
  end

  def destroy
    absent_book = AbsentContact.find(params[:id])
    absent_book.destroy
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