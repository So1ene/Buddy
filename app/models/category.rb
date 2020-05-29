class Category < ApplicationRecord
  has_many :events, through: :event_categories
  has_many :event_categories, dependent: :destroy
  validates :name, presence: true

  def color
    case name
      when "outdoors"
        "#007782"
      when "live music"
        "#FF7662"
      when "food"
        "#FF4E40"
      when "drinks"
        "#007B70"
      when "sports"
        "#00C6B4"
      when "theater"
        "#FFA899"
      when "festival"
        "#FD8377"
      when "other"
        "#003B41"
    end
  end
end
