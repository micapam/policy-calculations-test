class QuoteForm < Reform::Form
  property :age
  property :trip_duration

  # Date of birth
  property :dob_day, virtual: true
  property :dob_month, virtual: true
  property :dob_year, virtual: true

  # Departure and return
  property :departure_date, virtual: true
  property :return_date, virtual: true

  validate :age_available
  validate :trip_duration_available

  private

  def age_available
    unless age.present?
      date_of_birth = parse_safely "#{dob_year}-#{dob_month}-#{dob_day}"

      if date_of_birth.present?
        self.age = Time.diff(date_of_birth, Time.now)[:year]
      end
    end

    unless age.present?
      errors.add :age, 'Age missing'
      errors.add :dob_day, 'Date of birth missing'
    end
  end

  def trip_duration_available
    unless trip_duration.present?
      dep = parse_safely fix_format departure_date
      ret = parse_safely fix_format return_date

      if dep.present? && ret.present?
        self.trip_duration = days_between dep, ret
      end
    end

    unless trip_duration.present?
      errors.add :trip_duration, 'Trip duration missing'
      errors.add :departure_date, 'Travel dates missing'
    end
  end

  def fix_format(str)
    m, d, y = str.split '/'
    "#{y}-#{m}-#{d}"
  end

  def parse_safely(str)
    Date.parse str rescue nil
  end

  def days_between(a, b)
    (b.to_datetime.to_i - a.to_datetime.to_i) / (60 * 60 * 24)
  end
end
