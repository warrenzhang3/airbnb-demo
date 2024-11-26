# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
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

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :address, :price, :city)
  end
end
