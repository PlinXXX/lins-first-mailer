class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
  has_many :created_events, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :events, through: :attendances, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

	after_create :welcome_send

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
