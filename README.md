## List Pull Requests

This application will list the pull requests made by a given GitHub user with additional details provided on specific pull requests. It uses the [GitHub API](https://developer.github.com/v3/) with no authentication so be wary of the [rate limit](https://api.github.com/rate_limit) that is associated with your IP address.

## Installation

Install the gem via:

    $ gem install list-pull-requests

## Usage

Execute the gem via:

    $ list-pull-requests

Follow the command line prompts. If an invalid username is entered the application will exit with an error message.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thegands/list_pull_requests.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
