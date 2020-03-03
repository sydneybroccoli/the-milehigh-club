class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.booking = current_user.bookings.last
    if review.save
      redirect_to user_aircraft_path(@review.bookings.aircraft)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).require(:rating, :content)
  end
end
