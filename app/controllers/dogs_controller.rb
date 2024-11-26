class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new

  end

  def create

  end
end
