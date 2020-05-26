class SpokenLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :user, :language, presence: true
end
