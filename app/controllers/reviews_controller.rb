class ReviewsController < ApplicationController
  def index

  end

  def new
    @review = Review.new
    @transaction = Transaction.find(params[:transaction_id])
  end

  def create
    @transaction = Transaction.find(params[:transaction_id])
    @review = Review.new(review_params)
    if @review.save
      redirect to transaction_path(@transaction.id)
    else
      render 'new'
    end
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end


end
