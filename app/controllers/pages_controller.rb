class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # => GET    /
  end

  def welcome
    # => GET    /welcome
  end

  def buddy
    # => GET    /buddy
  end
end
