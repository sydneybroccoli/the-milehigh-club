  class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(booking: @booking)
    @aircraft = @booking.aircraft
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    # @aircraft = @booking.aircraft
    authorize @review
    if @review.save
      redirect_to aircraft_path(@booking.aircraft)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
