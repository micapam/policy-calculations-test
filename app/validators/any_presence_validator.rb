class AnyPresenceValidator < ActiveModel::Validator
  def validate(record)
    unless options[:fields].any? { |attr| record[attr].present? }
      record.errors.add(:base, 'At least one of these attributes must be' +
        " present: #{options[:fields].join(', ')}")
    end
  end
end
