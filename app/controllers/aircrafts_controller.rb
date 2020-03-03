class AircraftsController < ApplicationController
  def index
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    @transaction = Transaction.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
