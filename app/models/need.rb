class Need < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :status, inclusion: {
    in: %w(aberta pendente concluída inativa),
    message: "%{value} não é um status possível!"
  }
  validates :deadline, presence: true

  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :users, through: :proposals
end
