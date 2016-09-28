class TripDurationBracket < ApplicationRecord
  include RangeBracket

  has_many :prices
end
