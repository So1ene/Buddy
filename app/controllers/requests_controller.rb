class RequestsController < ApplicationController

  def new
    # => GET    /requests/new
    # @request = Request.new
  end

  def create
    # => POST   /requests
  end

  def show
    # => GET    /requests/:id
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
