require 'rails_helper'

RSpec.describe Price, type: :model do

  it { is_expected.to validate_presence_of :age_bracket }
  it { is_expected.to validate_presence_of :trip_duration_bracket }
  it { is_expected.to validate_uniqueness_of(:age_bracket_id).scoped_to(
    :trip_duration_bracket_id) }

end
