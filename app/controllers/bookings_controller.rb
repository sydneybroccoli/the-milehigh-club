  class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def booking_days
    days = @booking.end_date - @booking.start_date
  end

  def create
    booking = params[:booking]
    array_start_date = params[:booking][:start_date].split("-")
    array_end_date = params[:booking][:end_date].split("-")

    start_date = Date.new(array_start_date[0].to_i, array_start_date[1].to_i, array_start_date[2].to_i)
    end_date = Date.new(array_end_date[0].to_i, array_end_date[1].to_i, array_end_date[2].to_i)
    aircraft = Aircraft.find(params[:aircraft_id].to_i)
    aircraft_price = aircraft.unit_price
    number_of_days = (end_date - start_date).to_i
    total_price = aircraft_price * number_of_days
    @booking = Booking.new(start_date: start_date, end_date: end_date)
    @booking.final_price = total_price
    @booking.booking_type = "rental"
    @booking.aircraft = Aircraft.find(params[:aircraft_id].to_i)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      render '/aircraft/show'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end


   def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :start_date, :end_date, :confirm, :seen, :booking_type, :final_price, :user, :aircraft)
  end
end
