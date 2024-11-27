class BookingsController < ApplicationController
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

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
