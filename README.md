# XmlHasher_with_attributes

Fast XML to Ruby Hash converter

This gem is a fork of a fork of [XmlHasher](https://github.com/cloocher/xmlhasher) (through [pawelma](https://github.com/pawelma/xmlhasher)).
Regarding the original code, there's only one difference : it does not skip attributes if only content is provided.
I did the work to publish the gem on rubygems.org with a different name to make it available.

Example:
```ruby
XmlHasher.parse('<tag attribute="attr_val">content</tag>')

# In original xmlhasher above command will return following hash:
{
  tag: "content"
}

# With xmlhasher_with_attributes hash will be equal:
{
  tag: {
    attribute: "attr_val",
    value: "content"
  }
}
```

## Installation

* clone this repo
* run
```ruby
bundle install
rake install
```

* require
```ruby
require 'xmlhasher_with_attributes'
```

## Usage

```ruby
require 'xmlhasher_with_attributes'

# XmlHasher global configuration
#
# snakecase - convert all keys to snake case notation
# ignore_namespaces - remove XML namespaces
# string_keys - represent keys as Strings instead of Symbols
#
# here is default configuration
XmlHasher.configure do |config|
  config.snakecase = true
  config.ignore_namespaces = true
  config.string_keys = false
end

# alternatively, specify configuration options when instantiating a Parser
parser = XmlHasher::Parser.new(
  :snakecase => true,
  :ignore_namespaces => true
  :string_keys => false
)

# by default, XmlHasher will convert all keys to symbols.  If you want all keys to be Strings, set :string_keys option to 'true'

# parse XML file
XmlHasher.parse(File.new('/path/to/my/file.xml'))

# parse XML string
XmlHasher.parse("<tag1><tag2>content</tag2></tag1>")
# => {:tag1=>{:tag2=>"content"}}
```

## Publication
```
gem build xmlhasher_with_attributes.gemspec
  Successfully built RubyGem
  Name: xmlhasher_with_attributes
  Version: 1.0.1
  File: xmlhasher_with_attributes-1.0.1.gem
gem push xmlhasher_with_attributes-1.0.1.gem
```

## Requirements

* Ruby 1.8.7 or higher

## Copyright
Copyright (c) 2013 Gene Drabkin.
See [LICENSE][] for details.

[license]: LICENSE.md
