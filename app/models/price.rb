class Price < ApplicationRecord
  belongs_to :age_bracket
  belongs_to :trip_duration_bracket

  validates :trip_duration_bracket, presence: true
  validates :age_bracket, presence: true
  validates :age_bracket_id, uniqueness: { scope: :trip_duration_bracket_id }

  def self.for_brackets(age_bracket, trip_duration_bracket)
    Price.find_by age_bracket_id: age_bracket.id,
      trip_duration_bracket_id: trip_duration_bracket.id
  end
end
