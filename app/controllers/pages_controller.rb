class PagesController < ApplicationController

  def home
    # => GET    /
  end

  def welcome
    # => GET    /welcome
    @user = current_user
  end

  def buddy
    # => GET    /buddy
  end

end
