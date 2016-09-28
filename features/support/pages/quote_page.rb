module Pages
  class QuotePage < SitePrism::Page
    set_url "/quotes{/id}"

    element :price, '.price'
  end
end
