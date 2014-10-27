# Sinatra and Google Currency API – Part 2

Repository accompanying the guest blog post on rubylearning.com

http://rubylearning.com/blog/2013/09/04/sinatra-and-google-currency-api-part-1/

Commits are specific to steps in the tutorial.

## Orginal Author: Girish Sonawane

## Observations

When doing bundle I have got this warning:

    IMPORTANT! Some of the defaults have changed in Capybara 2.1. If you're experiencing failures,
    please revert to the old behaviour by setting:

        Capybara.configure do |config|
          config.match = :one
          config.exact_options = true
          config.ignore_hidden_elements = true
          config.visible_text_only = true
        end

    If you're migrating from Capybara 1.x, try:

        Capybara.configure do |config|
          config.match = :prefer_exact
          config.ignore_hidden_elements = false
        end

    Details here: http://www.elabs.se/blog/60-introducing-capybara-2-1

### APIs

* https://rate-exchange.appspot.com/

* Changed URL to:
    "http://rate-exchange.appspot.com/currency?from=#{from.upcase}&to=#{to.upcase}&q=#{args.first}"

*  `~/local/src/ruby/sinatra/sinatra-capybara`
