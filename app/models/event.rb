class Event < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_one_attached :photo
  validates :user, :name, :date_time, :address, :photo, :description, presence: true
  validates :description, length: { maximum: 150 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Calendar stuff:

    def start_time
        self.date_time
    end
    def end_time
        self.date_time
    end
end
