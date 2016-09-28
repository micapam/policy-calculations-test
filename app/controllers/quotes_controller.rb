class QuotesController < ApplicationController
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create! params.require(:quote).permit(:age, :trip_duration)
    redirect_to quote_path id: @quote.id
  end

  def show
    @quote = Quote.find params[:id]
  end
end
