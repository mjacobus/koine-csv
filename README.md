# Koine::Csv

Just another CSV parser

[![Build Status](https://travis-ci.org/mjacobus/koine-csv.svg)](https://travis-ci.org/mjacobus/koine-csv)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/koine-csv/badge.svg?branch=master)](https://coveralls.io/github/mjacobus/koine-csv?branch=master)
[![Code Climate](https://codeclimate.com/github/mjacobus/koine-csv/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/koine-csv)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/koine-csv/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/koine-csv/?branch=master)
[![Build Status](https://travis-ci.org/mjacobus/koine-csv.svg?branch=master)](https://travis-ci.org/mjacobus/koine-csv)
[![Gem Version](https://badge.fury.io/rb/koine-csv.svg)](https://badge.fury.io/rb/koine-csv)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'koine-csv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install koine-csv

## Usage

```ruby
parser = Koine::Csv::CsvParser.new(column_separator: ";")

content = "a;b\nc;d\n"

result = parser.parse(content)

# result = [
#   ['a', 'b'],
#   ['c', 'd'],
# ]
```

### Mapped Columns

```ruby
parser = MappedColumnsParser.new({
  column_names: [:name, :last_name]
})

content = "jon;doe\njohn;travolta\n"

result = parser.parse(content)

# result = [
#   { name: 'jon', last_name: 'doe'},
#   { name: 'john', last_name: 'travolta'},
# ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mgjacobus/koine-csv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

