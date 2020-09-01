class AbsentContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_foreign_instance
  before_action :find_absent_contact_id, only: [:show, :edit, :update, :destroy]
  before_action :new_record, only: [:index, :new]
  before_action :get_teacher_records, only: :index
  before_action :get_parent_records, only: [:index, :create]
  
  def index
  end

  def new
  end

  def create
    @absent_contact = AbsentContact.new(absent_contact_params)
    if @absent_contact.absent_at.nil? || @absent_contact.reason.blank?
      flash.now[:alert] = '入力してください。'
      render :index
    elsif @absent_contact.absent_at >= Date.today
      @absent_contact.save
      flash[:notice] = "送信しました。"
      redirect_to room_absent_contacts_path(@room)
    else
      flash.now[:alert] = '本日以降の日付を入力してください。'
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @absent_contact.update(absent_contact_params)
      flash.now[:notice] = '内容を更新しました。'
      redirect_to room_absent_contacts_path(@room)
    else
      flash.now[:alert] = 'この内容では保存できません。日付が過去では？'
      render :edit
    end
  end

  def destroy
    @absent_contact.destroy
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

  def new_record
    @absent_contact = AbsentContact.new
  end

  def find_absent_contact_id
    @absent_contact = AbsentContact.find(params[:id])
  end

  def get_teacher_records
    @future_absent_contacts_for_teacher = AbsentContact.teacher_record(params[:room_id]).get_future
    @past_absent_contacts_for_teacher = AbsentContact.teacher_record(params[:room_id]).get_past
    @today_absent_contact_for_teacher = AbsentContact.teacher_record(params[:room_id]).get_today
  end

  def get_parent_records
    @future_absent_contacts_for_parent = AbsentContact.parent_record(current_user.id, params[:room_id]).get_future
    @past_absent_contacts_for_parent = AbsentContact.parent_record(current_user.id, params[:room_id]).get_past
    @today_absent_contact_for_parent = AbsentContact.parent_record(current_user.id, params[:room_id]).get_today
  end

  def absent_contact_params
    params.require(:absent_contact).permit(:absent_at, :kind, :reason, :after_contact, :t_checked).merge(room_id: params[:room_id], user_id: current_user.id)
  end

  def confirm_params
    params.permit(:t_checked)
  end

end


