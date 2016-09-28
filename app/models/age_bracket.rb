class AgeBracket < ApplicationRecord
  include RangeBracket

  has_many :prices
end
