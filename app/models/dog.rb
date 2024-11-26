class Dog < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, :address, :price, :city, presence: true
  validates :price, numericality: { greater_than: 0 }
end
