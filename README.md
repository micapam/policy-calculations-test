# Policy calculations (exercise)

## Requirements

- Ruby 2.2.3

## Quickstart

- Clone the repo locally.
- Prepare the system: `bundle`
- Initialise the database: `bundle exec rake db:setup`
- Run the server: `bundle exec rails server`
- Browse to <http://localhost:3000> and try it out.

To activate the challenge features, browse to <http://localhost:3000/flipper>
and enable them. (Currently only the birthday UI feature is implemented.)

To run the feature specs: `bundle exec spinach`

To run the unit tests: `bundle exec rspec`

## Brief rationale for gem & methodology choices

### Plain views
I've used standard Bootstrap and a couple of basic plugins as this is the
fastest way to get something up and running that doesn't look too shabby.

### BDD: Spinach
I prefer Spinach over Cucumber because, for step definitions, it uses standard
OOP rather than Cucumber's convoluted DSL, making sharing code between
features cleaner and easier to read.

### Feature toggles: Flipper
I am using the feature toggle library Flipper in order to show (and test) the
various versions of the form mentioned (i.e. with the 'bonus challenge' features
enabled or disabled).

### Page Object Model: SitePrism
This is definitely overkill for such a small project. But the point is to show
off, right? :) I'm in the habit of using SitePrism for larger projects because
it keeps Spinach step definitions clean of view implementation details (such as
CSS selectors); not only does this make the step definitions clearer, it means
that usually only the SitePrism code needs to be updated after cosmetic view
changes.

## Next / todo

- Second challenge
