class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :school
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :absent_contacts

  def admin?
    admin
  end
end
