class AircraftsController < ApplicationController
  before_action :set_aircraft, except: [:index, :new, :create]

  def index
    # @aircrafts = Aircraft.all

    @aircrafts = Aircraft.geocoded #returns flats with coordinates

    @markers = @aircrafts.map do |aircraft|
      {
        lat: aircraft.latitude,
        lng: aircraft.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { aircraft: aircraft }),
        image_url: helpers.asset_url('mapMarker.png')
      }
    end
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    @booking = Booking.new
    # @reviews = @aircraft.bookings.reviews
    @marker = {
        lat: @aircraft.latitude,
        lng: @aircraft.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { aircraft: @aircraft })
      }
  end

  def new
    @user = current_user
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    @aircraft.user = current_user
    if @aircraft.save
      redirect_to aircraft_path(@aircraft)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @aircraft.update(aircraft_params)
    redirect_to aircraft_path(@aircraft)
  end

  def destroy
    @aircraft.destroy
    redirect_to user_path(@aircraft.user)
  end

  private

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
  end

  def aircraft_params
    params.require(:aircraft).permit(:make, :model, :location, :unit_price, :capacity, :hours, :year, :description, photos: [])
  end
end
