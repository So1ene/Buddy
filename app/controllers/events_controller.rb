class EventsController < ApplicationController

  def index
    # => GET    /events
  end

  def show
    # => GET    /events/:id
  end

  def new
    # => GET    /events/new
  end

  def create
    # => POST   /events
  end

  def delete
    # => GET    /events/:id/delete
  end

  def destroy
    # => DELETE /events/:id
  end

end
