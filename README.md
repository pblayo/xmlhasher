# CW_XmlHasher

Fast XML to Ruby Hash converter

This gem is fork of [XmlHasher](https://github.com/cloocher/xmlhasher).
It has only one difference between original code: it does not skip attributes if only content is provided.

Example:
```ruby
XmlHasher.parse('<tag attribute="attr_val">content</tag>')

# In original XmlHasher above command will return following hash:
{
  tag: "content"
}

# In this fork hash will be equal:
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
require 'cw_xmlhasher'
```

## Usage

```ruby
require 'cw_xmlhasher'

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

## Requirements

* Ruby 1.8.7 or higher

## Copyright
Copyright (c) 2013 Gene Drabkin.
See [LICENSE][] for details.

[license]: LICENSE.md
test
