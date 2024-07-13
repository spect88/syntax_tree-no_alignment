# SyntaxTree plugin: no_alignment

SyntaxTree gem can format your Ruby code and I think it's pretty good at that!
Despite not having many configuration options, it does have a plugin system 
for people who want to change a thing or two in its behavior.

There are 2 common ways to [align arguments in a multiline method call](rubocop_rule):

- align them to the first argument
- use fixed indentation

SyntaxTree uses both, depending on whether you use parentheses or not:

```ruby
with_parens(
  "lorem ipsum",
  "dolor sit amet",
  "consectetur adipiscing elit"
)

without_parens "lorem ipsum",
               "dolor sit amet",
               "consectetur adipiscing elit"
```

Parens-less syntax is often used for DSLs, which is probably why it gets this special treatment.

This plugin will remove this exception and make all indentation fixed:

```ruby
with_this_plugin "lorem ipsum",
  "dolor sit amet",
  "consectetur adipiscing elit"
```

[rubocop_rule]: https://docs.rubocop.org/rubocop/cops_layout.html#layoutargumentalignment

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add syntax_tree-no_alignment

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install syntax_tree-no_alignment

## Usage

Example:
```
stree write --plugins=no_alignment lib/**/*.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spect88/syntax_tree-no_alignment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
