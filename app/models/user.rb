class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, :ni, presence: true
  validates :ni, uniqueness: true, format: {with: /((\d{14})|(\d{11}))/, message: "Invalid. Try again, please." }
end
