class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to aircrafts_path(@transaction)
    else
      render 'new'
    end
  end

  def new
    @transaction = Transaction.new
  end
end
