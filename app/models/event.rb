class Event < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :categories, through: :event_categories
  validates :user, :name, :date, :time, :address, :photo, :description, presence: true
end
