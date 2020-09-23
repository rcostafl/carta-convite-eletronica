class User < ApplicationRecord
  has_many :needs, dependent: :destroy   # Include default devise modules. Others available are: retornar esta linha
  has_many :proposals # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
