class Language < ApplicationRecord

has_many :users, through: :spoken_languages

end
