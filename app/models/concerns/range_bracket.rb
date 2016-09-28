=begin
Convenience class for models that represent a range. Prevents overlap, etc.
=end
require 'active_support/concern'

module RangeBracket
  extend ActiveSupport::Concern

  included do
    validates :min, :max, overlap: true
    validates_with AnyPresenceValidator, fields: %w(min max)
    validate :sane_range

    scope :including, ->(value) {
      # The nasty big number in the query below is SQLite3's integer max:
      # http://stackoverflow.com/questions/4448284/sqlite3-integer-max-value
      where('IFNULL(min,0) <= ? AND IFNULL(max,9223372036854775807) >= ?',
        value, value)
    }

    def self.matching_value(value)
      including(value).first # ...and only, because of our overlap validation.
    end
  end

  private

  def sane_range
    if max.present? && min.present?
      if max < min
        errors.add :max, 'Max cannot be less than min'
      end
    end
  end
end
