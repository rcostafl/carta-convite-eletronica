class Proposal < ApplicationRecord
  validates :description, presence: true
  validates :value, presence: true

  belongs_to :need
  belongs_to :user
end
