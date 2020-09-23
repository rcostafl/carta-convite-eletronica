class User < ApplicationRecord
  # Include default devise modules. Others available are: retornar esta linha
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :needs, dependent: :destroy
  has_many :proposals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, :ni, presence: true
  validates :ni, uniqueness: true, format: {with: /((\d{14})|(\d{11}))/, message: "NI inválido. Por favor, insira um NI válido." }
end
