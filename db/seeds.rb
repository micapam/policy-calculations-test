# Note that these seeds are *not* idempotent. Running it more than once without
# clearing out the old data will cause errors.

def ranges_to_models(clazz, *ranges)
  ranges.collect do |min, max|
    clazz.create! min: min, max: max
  end
end

ages = ranges_to_models AgeBracket, [18, 49], [50, 59], [60, 69]
durations = ranges_to_models TripDurationBracket, [1, 7], [8, 14], [15, 21], [22]

[[50, 60, 70],
 [60, 73, 80],
 [70, 80, 90],
 [82, 90, 100]].each_with_index do |age_costs, duration_idx|
   age_costs.each_with_index do |cost, age_idx|
     Price.create! do |p|
       p.cost = cost
       p.age_bracket = ages[age_idx]
       p.trip_duration_bracket = durations[duration_idx]
     end
   end
end
