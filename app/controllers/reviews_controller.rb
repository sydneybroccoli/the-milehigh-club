  class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:transaction_id])
  end

  def create
    @booking = Booking.find(params[:transaction_id])
    @review = Review.new(review_params)
    # @review.booking = @booking
    @review.booking = current_user.bookings.last
    authorize @review
    if review.save
      redirect_to user_aircraft_path(@review.booking.aircraft)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).require(:rating, :content)
  end
end
