# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :calculate_total_price]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = current_user.dogs.build(dog_params)
    if @dog.save
      redirect_to dogs_path, notice: "Dog created successfully"
    else
      render :new
    end
  end

  # Custom action for calculating total price
  def calculate_total_price
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    diff_days = (end_date - start_date).to_i + 1
    total_price = diff_days * @dog.price

    render json: { total_price: total_price }
  rescue ArgumentError, NoMethodError
    render json: { error: "Invalid input for total price calculation" }, status: :unprocessable_entity
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :address, :price, :city)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to dogs_path, alert: "Dog not found"
  end
end
