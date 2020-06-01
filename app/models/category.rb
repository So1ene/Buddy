class Category < ApplicationRecord
  has_many :events, through: :event_categories
  has_many :event_categories, dependent: :destroy
  validates :name, presence: true

  def color
    case name
      when "outdoors"
        "#2EC5A6"
      when "live music"
        "#1B98ED"
      when "food"
        "#F7B576"
      when "drinks"
        "#C64834"
      when "sports"
        "#427434"
      when "theater"
        "#855BCE"
      when "festival"
        "#DA9C91"
      when "other"
        "#3E484A"
    end
  end
end
