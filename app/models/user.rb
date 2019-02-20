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
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "Conversation"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "Conversation"


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
