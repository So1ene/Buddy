class PagesController < ApplicationController

  def home
    # => GET    /
  end

  def welcome
    # => GET    /welcome
    @user = current_user
  end

  def update_location
    # => PATCH    /

  end

  def buddy
    # => GET    /buddy
  end

  def calendar
    # => GET    /calendar
  end
end
