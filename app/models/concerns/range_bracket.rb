=begin
Convenience class for models that represent a range. Prevents overlap, etc.
=end
require 'active_support/concern'

module RangeBracket
  extend ActiveSupport::Concern

  included do
    validates :min, :max, overlap: true
    validates_with AnyPresenceValidator, fields: %w(min max)
    validates :max, numericality: { greater_than_or_equal_to: :min },
      if: Proc.new { |rb| rb.max.present? && rb.min.present? }
  end
end
