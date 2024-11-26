class DogsController < ApplicationController
  def index

  end

  def new

  end

  def create
    @dog = Dog.new(dog_params)
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
