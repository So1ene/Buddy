class Request < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, :event, :motivation, :status, presence: true
end
