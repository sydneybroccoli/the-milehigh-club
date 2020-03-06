  class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @aircraft = Aircraft.find(params[:aircraft_id])
  end

  def create
    @review = Review.new(review_params)
    @aircraft = Aircraft.find(params[:aircraft_id])
    authorize @review
    if review.save
      redirect_to user_aircraft_path(@review.booking.aircraft)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
