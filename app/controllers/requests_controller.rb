class RequestsController < ApplicationController

  def new
    # => GET    /requests/new
  end

  def create
    # => POST   /requests
  end

  def show
    # => GET    /events/:id
  end

  def update
    # => PATCH  /requests/:id
  end

  def submitted
    # => GET    /requests/:id/submitted
  end

  def incoming
    # => GET    /requests/incoming
  end

end
