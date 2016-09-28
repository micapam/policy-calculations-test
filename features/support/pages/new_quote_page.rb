module Pages
  class NewQuotePage < SitePrism::Page
    set_url "/quotes/new"

    element :age_field, 'input[name="quote[age]"]'
    element :trip_duration_field, 'input[name="quote[trip_duration]"]'
    element :submit_button, 'input[type="submit"]'
  end
end
