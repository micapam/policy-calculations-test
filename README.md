# Policy calculations (test)

## TODO: Quickstart

## Brief rationale for gem & methodology choices

### Very plain views
I've used no JavaScript and hardly any CSS because I just want to show a simple,
minimal working example that meets the criteria. (I've been a little more fancy
with some other things, see below.)

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
