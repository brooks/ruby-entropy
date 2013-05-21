ruby-entropy
============

Gem for calculating password strength

$ gem install ruby-entropy

returns password strength on a 0-100 scale


example:

require 'ruby-entropy'

my_password = Password.new('open sesame')

my_password.strength
  
  => 24.15 
