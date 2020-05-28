class Language < ApplicationRecord
has_many :spoken_languages, dependent: :destroy
has_many :users, through: :spoken_languages
validates :name, presence: true

end
