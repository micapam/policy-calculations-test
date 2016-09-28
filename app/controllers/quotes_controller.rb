class QuotesController < ApplicationController
  before_action :initialise_form, only: [:new, :create]

  def new
  end

  def create
    if @quote.validate(params[:quote])
      @quote.save
      redirect_to quote_path id: @quote.model.id
    else
      render :new
    end
  end

  def show
    @quote = Quote.find params[:id]
  end

  def initialise_form
    @quote = QuoteForm.new Quote.new

    @months = Date::MONTHNAMES.compact.each_with_index.collect do |m, i|
      [m, i + 1]
    end
  end
end
