Great Expectations
==================

Code and content for automation presentation on rspec 3.3 features.

## Usage

This is a simple, bare-bones Rails app. Its handful of specs demonstrate a couple of RSpec's latest features. To see these in action, follow these steps:

1. Clone this repo to your machine: `git clone https://github.com/mycargus/great-expectations.git`
2. Now `cd great-expectations`
3. Install gem dependencies: `bundle install`
4. This app uses postgres. Start your postgres database service.
5. Initialize the app's database: `rake db:create`, followed by `rake db:migrate`
6. Run the specs and see RSpec's latest and greatest in action: `rspec spec/features/`

To see the code for these specs, open `spec/features/books_spec.rb`.

## Highlights
- aggregate_failures
- compound expectations

### Notes
See great_expectations.rb for an outline of the presentation, as well as links to relevant rspec docs.
