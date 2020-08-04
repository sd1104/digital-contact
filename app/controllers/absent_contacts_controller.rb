class AbsentContactsController < ApplicationController
  before_action :set_foreign_instance
  
  def index
    @future_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_future.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
    @future_absent_contacts_for_teacher = AbsentContact.includes(:room, :user).get_future.where(room_id: (params[:room_id])).order('absent_at DESC')
    @past_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_past.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
    @past_absent_contacts_for_teacher = AbsentContact.includes(:room, :user).get_past.where(room_id: (params[:room_id])).order('absent_at DESC')
    @today_absent_contact_for_parent = AbsentContact.includes(:room, :user).get_today.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
    @today_absent_contact_for_teacher = AbsentContact.includes(:room, :user).get_today.where(room_id: (params[:room_id])).order('absent_at DESC')
    @absent_contact = AbsentContact.new
    
  end

  def create
    @absent_contact = @room.absent_contacts.new(absent_contact_params)
    if @absent_contact.absent_at.nil? || @absent_contact.reason.blank?
      @future_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_future.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @past_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_past.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @today_absent_contact_for_parent = AbsentContact.includes(:room, :user).get_today.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @absent_contact = AbsentContact.new
      flash.now[:alert] = '入力してください。'
      render :index
    elsif @absent_contact.absent_at >= Date.today
      AbsentContact.create(absent_contact_params)
      flash[:notice] = "送信しました。"
      redirect_to room_absent_contacts_path(@room)
    else
      @future_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_future.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @past_absent_contacts_for_parent = AbsentContact.includes(:room, :user).get_past.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @today_absent_contact_for_parent = AbsentContact.includes(:room, :user).get_today.where(user_id: current_user.id, room_id: (params[:room_id])).order('absent_at DESC')
      @absent_contact = AbsentContact.new
      flash.now[:alert] = '本日以降の日付を入力してください。'
      render :index
    end
  end

  def edit
    @absent_contact = AbsentContact.find(params[:id])
  end

  def update
    @absent_contact = AbsentContact.find(params[:id])
    if @absent_contact.update(absent_contact_params)
      flash.now[:notice] = '内容を更新しました。'
      redirect_to room_absent_contacts_path(@room)
    else
      flash.now[:alert] = 'この内容では保存できません。日付が過去では？'
      render :edit
    end
  end

  def destroy
    absent_book = AbsentContact.find(params[:id])
    absent_book.destroy
    flash[:notice] = "無事削除されました。"
    redirect_to room_absent_contacts_path(@room)
  end

  def absent_contact_t_checked
    @absent_contact = AbsentContact.find(params[:format])
    if @absent_contact.update(confirm_params)
      redirect_to room_absent_contacts_path(@room)
    else
      render :edit
    end
  end

  
  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

  def absent_contact_params
    params.require(:absent_contact).permit(:absent_at, :kind, :reason, :after_contact, :t_checked).merge(room_id: params[:room_id], user_id: current_user.id)
  end

  def confirm_params
    params.permit(:t_checked)
  end

end