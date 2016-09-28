class Spinach::Features::CalculatePrice < Spinach::FeatureSteps
  step 'the company has a pricing matrix' do
    require './db/seeds'
  end

  step 'I am a 25-year-old man taking a four-day trip abroad' do
    # Sugar
  end

  step 'I am a 55-year-old man taking a four-day trip abroad' do
    # Sugar
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
end
