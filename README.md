# missing_i18n

This is a [rails 3 mountable engine](http://railscasts.com/episodes/277-mountable-engines).

It allows you to see which locales have missing entries. You probably want to use it in your development/staging environment.

## Installation

On your Gemfile:

    gem 'missing_i18n'

On your `config/routes.rb`:

    unless Rails.env.production? # optional, but recommended
      mount MissingI18n::Engine, :path => '/missing_i18n'
    end

After that, you can go to [http://localhost:3000/missing_i18n](http://localhost:3000/missing_i18n) to get a list of all the locales and their
missing keys.

## Customization & scope filtering

You can override MissingI18n' only view by creating any of the following files:

* `app/views/missing_i18n/locales/index.html.erb`
* `app/views/missing_i18n/locales/show.html.erb`

You can similarly override MissingI18n controller by defining `app/views/missing_i18n/locales_controller.rb`.

Finally, you will probably want to add "ignored paths" to `missing_i18n`, for example for avoiding certain groups of prefixes.

To ignore (for example) the entries inserted by the [Faker](http://faker.rubyforge.org/), create an initializer file with this text:

    # config/initializers/missing_i18n.rb

    if defined? MissingI18n
      MissingI18n.ignored_scopes += ['faker']
    end

You can add more than one scope on that array. Also, you can add dot-separated scopes (`'foo.bar.baz'`) to filter more precisely.

Notice that `missing_i18n` [ignores some scopes by default](https://github.com/kikito/missing_i18n/blob/master/lib/missing_i18n.rb). These are scopes missing in some
locales of [rails-i18n](https://github.com/svenfuchs/rails-i18n), and in general it is safe to ignore those. If you need to include them in the list, you can; just
set `MissingI18n.ignored_scopes` to whatever you want; just use `=` instead of `+=`:

    # config/initializers/missing_i18n.rb

    if defined? MissingI18n
      MissingI18n.ignored_scopes = ['my.scopes', 'which.dont.include', 'the.default.ones']
    end

Everything will work as long as `MissingI18n.ignored_scopes` is an array of strings.

## Tests

This engine has no tests. I'm basically using non-public methods from the i18n gem, so it's extremely brittle and coupled with the implementation details of i18n.

However, you can try the dummy app by executing:

    cd test/dummy
    rails s

If you then go to [http://localhost:3000](http://localhost:3000), you should see some differences between the es and en locales. Try modifying the files inside `test/dummy/config/locales` and
refreshing the page.

Feel free to send me pull requests with tests if you want!




