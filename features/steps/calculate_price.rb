class Spinach::Features::CalculatePrice < Spinach::FeatureSteps
  step 'the company has a pricing matrix' do
    ages = ranges_to_models :age_bracket, [18, 49], [50, 59], [60, 69]

    durations = ranges_to_models :trip_duration_bracket, [1, 7], [8, 14],
      [15, 21], [22]

    [[50, 60, 70],
     [60, 73, 80],
     [70, 80, 90],
     [82, 90, 100]].each_with_index do |age_costs, duration_idx|
       age_pries.each_with_index do |cost, age_idx|
         Fabricate(:price, cost: cost) do
           age_bracket ages[age_idx]
           trip_duration_bracket durations[duration_idx]
         end
       end
    end
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

  private

  def ranges_to_models(model_name, *ranges)
    ranges.collect do |min, max|
      Fabricate(model_name, min: min, max: max)
    end
  end
end
