class Request < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, :event, :motivation, :status, presence: true

  def pending? 
    status == "Pending"
  end

  def accepted?
    status == "Acceped"
  end

  def declined?
    status == "Declined"
  end

  def cancelled?
    status == "Cancelled"
  end
end
