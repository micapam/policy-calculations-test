class Quote < ApplicationRecord
  validates :age, :trip_duration, presence: true

  def price
    age_bracket = AgeBracket.matching_value age
    trip_duration_bracket = TripDurationBracket.matching_value trip_duration

    if age_bracket.present? && trip_duration_bracket.present?
      Price.for_brackets age_bracket, trip_duration_bracket
    end
  end
end
