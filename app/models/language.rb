class Language < ApplicationRecord

has_many :users, through: :spoken_languages
validates :name, presence: true

end
