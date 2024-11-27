class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def index
    @bookings = current_user.bookings
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = @dog.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: 'Booking created successfully.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
