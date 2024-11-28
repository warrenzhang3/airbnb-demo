# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  before_action :set_dog, only: [:new, :create]
  before_action :set_booking, only: [:edit, :update, :accept, :decline]

  def index
    if current_user.owner?
      @bookings_received = Booking.joins(:dog).where(dogs: { user_id: current_user.id })
    end
    @bookings_made = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @dog.bookings.build(booking_params)
    @booking.user = current_user
    @booking.status = 'pending'

    calculate_total_price(@booking)

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
      calculate_total_price(@booking)
      redirect_to bookings_path, notice: 'Booking updated successfully.'
    else
      render :edit
    end
  end

  def accept
    if @booking.update(status: 'accepted')
      redirect_to bookings_path, notice: 'Booking has been accepted.'
    else
      redirect_to bookings_path, alert: 'Failed to accept the booking.'
    end
  end

  def decline
    if @booking.update(status: 'declined')
      redirect_to bookings_path, notice: 'Booking has been declined.'
    else
      redirect_to bookings_path, alert: 'Failed to decline the booking.'
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to dogs_path, alert: 'Dog not found.'
  end

  def set_booking
    @booking = Booking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bookings_path, alert: 'Booking not found.'
  end

  def calculate_total_price(booking)
    if booking.start_date && booking.end_date
      diff_days = (booking.end_date - booking.start_date).to_i + 1
      booking.total_price = diff_days * booking.dog.price
    else
      booking.total_price = 0
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end
end
