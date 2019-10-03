# Simple workaround

Paste the code below to your ruby file and add gems you want to use in the block.

```ruby
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'spell_generator'
end
```

# References 
- [bundler - Using a gem in a pure ruby script (not Rails) - Stack Overflow](https://stackoverflow.com/questions/25373689/using-a-gem-in-a-pure-ruby-script-not-rails)
- [Bundler: How to use Bundler in a single-file Ruby script](https://bundler.io/v2.0/guides/bundler_in_a_single_file_ruby_script.html)
