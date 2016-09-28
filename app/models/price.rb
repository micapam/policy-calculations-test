class Price < ApplicationRecord
  belongs_to :age_bracket
  belongs_to :trip_duration_bracket

  validates :trip_duration_bracket, presence: true
  validates :age_bracket, presence: true
  validates :age_bracket_id, uniqueness: { scope: :trip_duration_bracket_id }
end
