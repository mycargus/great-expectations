Great Expectations for RSPec

dependecies: rspec-rails => 3.3.0
=======================

Aggregate Failures:

Check this out!
https://relishapp.com/rspec/rspec-expectations/v/3-3/docs/aggregating-failures
http://rspec.info/blog/2015/06/rspec-3-3-has-been-released/

-- Word of Caution: still important to separate test cases as much as possible, i.e. assert a single behavior in each spec, BUT...

- Problem: I have a spec that necessitates multiple assertions, but when one assertion fails then the subsequent ones get skipped.
- Allows multiple expectations in the provided block to fail, then aggregates them to the test runs output.
- Useful when you want a full list of problems that need attention on a failed spec.


Examples:

it 'redirects to a new book form' do
  click_link 'New Book'

  expect(page).to have_content 'New Book'
  expect(current_url).to have_content '/books/new'
end

SHOW EXAMPLES:
1. aggregate_failure OFF, first assertion fails, second one passes
2. aggregate_failure ON, first assertion fails, second one passes

3. aggregate_failure OFF, both fail
4.a aggregate_failure ON, both fail (use :aggregate_failures tag for spec)
  b aggregate_failure ON, both fail (use :aggregate_failures tag for context)
  c aggregate_failure ON, both fail (use :aggregate_failures tag for describe)
5. aggregate_failure ON, both fail (use aggregate_failures('message') block)



Method:
#aggregate_failures(label = nil, metadata = {}) { ... } ⇒ Object

Yields: Block containing as many expectations as you want. The block is simply yielded to, so you can trust that anything that works outside the block should work within it.

** Note: "When you've got dependent expectations (e.g. where an expectation only makes sense if the prior expectation passed),
or if you're using expectations to express a pre-condition, you'll probably want the example to immediately abort when the expectation fails."


See docs for more details (exceptions raised):
http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers%3Aaggregate_failures

=======================

Compound Expectations

https://relishapp.com/rspec/rspec-expectations/docs/compound-expectations

BOOKS:

it 'redirects to a new book form' do
  click_link 'New Book'

  # AND examples
  expect(page.text).to start_with('New').and end_with('Back')
  expect(current_url).to start_with('http://') & end_with('/books/new')

  # OR examples
  expect(page.text).to start_with('New').or start_with('cheese')
  expect(current_url).to start_with('http://') | end_with('/books/new')
end

=======================

Composing Matchers:

https://relishapp.com/rspec/rspec-expectations/v/3-3/docs/composing-matchers

- starts_with()


Docs:
http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers

=======================

