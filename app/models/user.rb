# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :dogs, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def owner?
    dogs.exists?
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end
