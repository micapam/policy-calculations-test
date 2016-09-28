class QuotesController < ApplicationController
  def new
    @quote = QuoteForm.new Quote.new

    @months = Date::MONTHNAMES.compact.each_with_index.collect do |m, i|
      [m, i + 1]
    end
  end

  def create
    @form = QuoteForm.new Quote.new

    if @form.validate(params[:quote])
      @form.save
      redirect_to quote_path id: @form.model.id
    else
      #TODO Handle errors
    end
  end

  def show
    @quote = Quote.find params[:id]
  end
end
