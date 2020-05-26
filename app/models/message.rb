class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def other_user(user)
    if self.sender == user
      self.receiver
    else
      self.sender
    end
  end
end
