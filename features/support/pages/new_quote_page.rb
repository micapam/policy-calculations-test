module Pages
  class NewQuotePage < SitePrism::Page
    set_url "/quotes/new"

    element :age_field, 'input[name="quote[age]"]'
    element :trip_duration_field, 'input[name="quote[trip_duration]"]'
    element :submit_button, 'input[type="submit"]'

    element :birth_day_field, 'input[name="quote[dob_day]"]'
    element :birth_year_field, 'input[name="quote[dob_year]"]'
    elements :birth_month_options, 'select[name="quote[dob_month]"] option'

    def birth_month_option(month)
      birth_month_options.find do |option|
        option.text == month
      end
    end
  end
end
