class AircraftsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_aircraft, except: [:index, :new, :create]

  def index
    @aircrafts = policy_scope(Aircraft.all)

    @aircrafts = Aircraft.geocoded #returns flats with coordinates

    if params[:query].present?
      @aircrafts = Aircraft.search_by_make_and_model(params[:query])
    else
      @aircrafts = Aircraft.geocoded
    end
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
        infoWindow: render_to_string(partial: "info_window", locals: { aircraft: @aircraft }),
        image_url: helpers.asset_url('mapMarker.png')
      }
  end

  def new
    @user = current_user
    @aircraft = Aircraft.new
    authorize @aircraft
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    @aircraft.user = current_user
    authorize @aircraft
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
    if @aircraft.bookings.nil?
      @aircraft.destroy
      redirect_to user_path(current_user)
    else
      # DESTROY ALL REVIEWS RELATED TO AIRCRAFT
      @aircraft.reviews.each do |review|
        review.destroy
      end
      # DESTROY ALL BOOKINGS RELATED TO AIRCRAFT
      @aircraft.bookings.each do |booking|
        booking.destroy
      end
      @aircraft.destroy
      redirect_to user_path(current_user)
    end

  end

  private

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
    authorize @aircraft
  end

  def aircraft_params
    params.require(:aircraft).permit(:make, :model, :location, :unit_price, :capacity, :hours, :year, :description, photos: [])
  end
end
