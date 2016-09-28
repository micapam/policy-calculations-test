class Spinach::Features::CalculatePrice < Spinach::FeatureSteps
  step 'the company has a pricing matrix' do
    require './db/seeds'
  end

  step 'I am a 25-year-old man taking a four-day trip abroad' do
    # Sugar
  end

  step 'I browse to the insurance price calculation page' do
    @form_page = TripFormPage.new
    @form_page.load
  end

  step 'I enter my age as 25' do
    @form_page.age_field.set 25
  end

  step 'I enter my trip duration as four days' do
    @form_page.duration_field.set 4
  end

  step 'I submit my information' do
    @form_page.submit_button.click
  end

  step 'I should see that it will cost me $50' do
    @price_page = PricePage.new
    expect(@price_page.price).to eq '50'
  end
end
