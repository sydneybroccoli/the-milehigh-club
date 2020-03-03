class TransactionsController < ApplicationController
  def create
    transaction = params[:transaction]
    array_start_date = params[:transaction][:start_date].split("-")
    array_end_date = params[:transaction][:end_date].split("-")

    start_date = Date.new(array_start_date[0].to_i, array_start_date[1].to_i, array_start_date[2].to_i)
    end_date = Date.new(array_end_date[0].to_i, array_end_date[1].to_i, array_end_date[2].to_i)
    aircraft = Aircraft.find(params[:aircraft_id].to_i)
    aircraft_price = aircraft.price
    number_of_days = (end_date - start_date).to_i
    total_price = aircraft_price * number_of_days
    @transaction = Transaction.new(start_date: start_date, end_date: end_date)
    @transaction.final_price = total_price
    @transaction.transaction_type = "rental"
    @transaction.aircraft = Aircraft.find(params[:aircraft_id].to_i)
    @transaction.user = User.all.sample # Change ASAP after updating User model with Devise
    if @transaction.save
      redirect_to aircrafts_path(@transaction)
    else
      render 'new'
    end
  end

  def new
    @transaction = Transaction.new
  end

  private

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end
end
