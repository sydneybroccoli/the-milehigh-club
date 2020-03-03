class AircraftsController < ApplicationController
  before_action :set_aircraft, except: [:index, :new, :create]

  def index
    @aircrafts = Aircraft.all
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    @transaction = Transaction.new
  end

  def new
    @user = current_user
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    @aircraft.user = current_user
    if @aircraft.save
      redirect_to user_aircraft_path(@aircraft)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @aircraft.update
    redirect_to user_aircraft_path(@aircraft)
  end

  def destroy
    @aircraft.destroy
    redirect_to user_path(@user)
  end

  private

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
  end

  def aircraft_params
    params.require(:aircraft).require(:make, :model, :location, :price, :capacity, :hours, :year, :description)
  end
end
