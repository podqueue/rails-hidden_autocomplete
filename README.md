# rails-hidden_autocomplete
This is a Rails plugin to add `autocomplete="off"` to all hidden form inputs generated by Rails. This is necessary because Firefox has [a longstanding bug](https://bugzilla.mozilla.org/show_bug.cgi?id=520561) where it may populate hidden inputs **without** `autocomplete="off"` with completely random values. Since Rails uses hidden fields extensively for CSRF protection and non-standard HTTP methods, this issue is also tracked in the main Rails tracker here: [add autocomplete="OFF" to firefox-proof automagically added hidden fields like method](https://github.com/rails/rails/issues/42610)

You can read the announcement blog post here: <https://blog.podqueue.fm/2021/09/19/giving_back_to_rails_with_rails-hidden_autocomplete/>

This work has also been refactored into a Rails PR: <https://github.com/rails/rails/pull/43280>

## Usage
Using this plugin from a Rails 6.1 application should automatically override Rails methods which generate hidden form inputs to add an `autocomplete="off"` attribute.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails-hidden_autocomplete'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails-hidden_autocomplete
```

## Contributing
If you find a place that still emits hidden form inputs without an `autocomplete="off"` attribute, please feel free to submit a pull request to cover it.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
