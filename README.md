ruby-entropy
============

Gem for calculating password strength

$ gem install ruby-entropy

returns password strength on a 0-100 scale


example:

require 'ruby-entropy'

example = RubyEntropy.new('open sesame')

example.passphrase

  => open sesame

example.strength
  
  => 24.15 

Copyright (c) 2013 Brooks Mason 
<a href="https://github.com/broppler/ruby-entropy/blob/master/MIT-license">LICENSE</a>