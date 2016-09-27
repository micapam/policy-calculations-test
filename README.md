# Policy calculations (test)

## TODO: Quickstart

## Brief rationale for gem & methodology choices

### Spinach
I prefer Spinach over Cucumber because, for step definitions, it uses standard
OOP rather than Cucumber's convoluted DSL, making sharing code between
features cleaner and easier to read.

### SitePrism
This is definitely overkill for such a small project. But I'm in the habit of
using it for larger projects because it keeps Spinach step definitions clean of
view implementation details (such as CSS selectors); not only does this make
the step definitions clearer, it means that usually only the SitePrism code
needs to be updated after cosmetic view changes.
