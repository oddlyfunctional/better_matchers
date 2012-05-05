# BetterMatchers

Some matchers for making RSpec tests more semantic.

## Installation

Add this line to your application's Gemfile:

    gem 'better_matchers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install better_matchers

## Usage

	user.should have_error(:blank).on :name
	user.should_not have_error(:invalid).on :email

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
