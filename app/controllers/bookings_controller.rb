class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.includes(:dog)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end
end
