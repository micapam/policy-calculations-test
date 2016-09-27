=begin
Convenience class for models that represent a range. Prevents overlap, etc.
=end
require 'active_support/concern'

module RangeBracket
  extend ActiveSupport::Concern

  included do
    validates :min, :max, overlap: true
  end
end
