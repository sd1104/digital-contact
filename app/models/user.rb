class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :school, optional: true
  belongs_to :room, optional: true
  has_many :absent_contacts

  def admin?
    admin
  end
end
