class Spinach::Features::CalculatePrice < Spinach::FeatureSteps
  step 'the company has a pricing matrix' do
    require './db/seeds'
  end

  step 'the site does not have the date of birth feature enabled' do
    toggle_feature :birthday_ui, false
  end

  step 'the site does not have the trip calendar feature enabled' do
    toggle_feature :holiday_ui, false
  end

  step 'the site has the date of birth feature enabled' do
    toggle_feature :birthday_ui, true
  end

  step 'the site has the trip calendar feature enabled' do
    toggle_feature :holiday_ui, true
  end

  step 'I browse to the insurance price calculation page' do
    @form_page = Pages::NewQuotePage.new
    @form_page.load
  end

  step 'I enter my age as 25' do
    @form_page.age_field.set 25
  end

  step 'I enter my age as 65' do
    @form_page.age_field.set 65
  end

  step 'I enter my birth day as 24' do
    @form_page.birth_day_field.set 25
  end

  step 'I enter my birth month as June' do
    option = @form_page.birth_month_option('June')
    # byebug
    @form_page.birth_month_option('June').select_option
  end

  step 'I enter my birth year as 1961' do
    @form_page.birth_year_field.set 1961
  end

  step 'I enter my trip duration as 30 days' do
    @form_page.trip_duration_field.set 30
  end

  step 'I enter my trip duration as four days' do
    @form_page.trip_duration_field.set 4
  end

  step 'I enter my departure date as 10 October 2016' do
    @form_page.departure_field.set '10/10/2016'
  end

  step 'I enter my return date as 23 October 2016' do
    @form_page.return_field.set '10/23/2016'
  end

  step 'I enter my return date as 20 October 2016' do
    @form_page.return_field.set '10/20/2016'
  end

  step 'I submit my information' do
    @form_page.submit_button.click
    @quote_page = Pages::QuotePage.new
  end

  step 'I should see that it will cost me $50' do
    expect_price 50
  end

  step 'I should see that it will cost me $90' do
    expect_price 90
  end

  step 'I should see that it will cost me $80' do
    expect_price 80
  end

  step 'I should see that it will cost me $73' do
    expect_price 73
  end

  def toggle_feature(feature_name, bool)
    method = if bool
      :enable
    else
      :disable
    end

    Flipper::Rails.flipper.send method, feature_name
  end

  def expect_price(dollars)
    expect(@quote_page.price.text).to eq "$#{dollars}"
  end

  # Syntactic sugar steps - for spec readability but no functionality:

  step 'I am a 25-year-old man taking a four-day trip abroad' do; end
  step 'I am a 55-year-old man taking a 30-day trip abroad' do; end
  step 'I am a 65-year-old man taking a 13-day trip abroad' do; end
  step 'I am a 55-year-old man taking a 10-day trip abroad' do; end
end
