# Search by location

Using `ActiveRecord` and `geocoder`

## Motivation

Location data is stored in a separate model, but many models need to be filtered through the location model. Some have indirect associations with the location model, so I needed a scope in those models to abstract this. As en example consider the following association:

```
  ITEM -- n..1 --> STORE -- 1..1 --> LOCATION
```

And all the items near a location need to be filtered. It has to be through a scope so other scopes can be chained.

## The gist

Basically an `ActiveRecord` query, found it and tweaked it from [this StackOverflow answer](https://stackoverflow.com/questions/12298836/rails-inner-join-combined-with-geocoding-gem).

```ruby
  # app/models/item.rb
  # ...
  scope :near, (lambda do |location, distance|
    Item.includes(store: :geo_location)
        .references(:geo_location)
        .merge(GeoLocation.near(location, distance))
  end)
  # ...
```

## Also noteworthy

This example is reasonably tested, don't forget to check out the spec directory, and write some tests for your production code

## Contributing

Feel free to open a PR, Issue, or contact me, to suggest improvements or discuss any problems, errors or opinions.
