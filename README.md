# Ruby HL7 Library README
[![Build Status](https://travis-ci.org/salf/ruby-hl7.png?branch=master)](https://travis-ci.org/salf/ruby-hl7)

A simple way to parse and create HL7 2.x messages with Ruby.

Examples can be found in HL7::Message.

The version id can be found in the HL7::VERSION constant.

* Git:          http://github.com/ruby-hl7/ruby-hl7.git
* Docs:         http://ruby-hl7.rubyforge.org
* Rubygems:     https://rubygems.org/gems/ruby-hl7
* Rubyforge:    http://rubyforge.org/projects/ruby-hl7

Lists

* Developers: mailto:ruby-hl7-devel@rubyforge.org
* Users: mailto:ruby-hl7-users@rubyforge.org
* Google group: http://groups.google.com/group/ruby-hl7

Copyright (C) 2006-2010 Mark Guzman

Maintained by the Collaborative Software Initiative

* http://csinitiative.com
* http://trisano.org
* http://github.com/csinitiative/trisano

## Installation

In your Gemfile:

  `gem 'ruby-hl7', github: 'austinbachman/ruby-hl7', branch: 'master'`


## Basic Usage
Creating a new HL7 message
```ruby
# create a message
msg = HL7::Message.new

# create a MSH segment for our new message
msh = HL7::Message::Segment::MSH.new
msh.recv_app = "ruby hl7"
msh.recv_facility = "my office"
msh.processing_id = rand(10000).to_s

msg << msh # add the MSH segment to the message

puts msg.to_s # readable version of the message

puts msg.to_hl7 # hl7 version of the message (as a string)

puts msg.to_mllp # mllp version of the message (as a string)
```

Parse an existing HL7 message
```ruby
raw_input = open( "my_hl7_msg.txt" ).readlines
msg = HL7::Message.new( raw_input )

puts "message type: %s" % msg[:MSH].message_type
```
Setting `:format` for element of segment allows you to get hash:
```ruby
class HL7::Message::Segment::PID < HL7::Message::Segment
  ...
  add_field :patient_name, {:format => HL7::Message::DataTypes.XPN}
end

>> msg[:PID].patient_name
=> {"family_name"=>"Connor", "given_name"=>"John", "middle_name"=>"T", "suffix"=>"", "prefix"=>"", "degree"=>"", "name_type_code"=>"L", "origin"=>"Connor^John^M^^^^L"}

>> msg[:PID].patient_name['origin']
=> "Connor^John^M^^^^L"
```

## License
See the LICENSE file.