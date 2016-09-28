class QuoteForm < Reform::Form
  property :age
  property :trip_duration

  %w(day month year).each do |unit|
    property "dob_#{unit}".to_sym, virtual: true
  end

  validate :age_available

  def age_available
    unless age.present?
      if date_of_birth.present?
        self.age = Time.diff(date_of_birth, Time.now)[:year]
      else
        errors.add :age, 'Age must be specified'
      end
    end
  end

  def date_of_birth
    @afb ||= if dob_day.present? && dob_month.present? && dob_year.present?
      Date.parse "#{dob_year}-#{dob_month}-#{dob_day}" rescue nil
    end
  end
end
