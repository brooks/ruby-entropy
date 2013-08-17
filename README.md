![Logo](https://raw.github.com/broppler/ruby-entropy/master/logo.png)
<div>Copyright 2013 Brooks Mason ~ <a href="https://github.com/broppler/ruby-entropy/blob/master/MIT-license">LICENSE</a></div>

Ruby Entropy is an algorithm for evaluating the robustness of passphrases. The algorithm uses standard entropy to calculate a base passphrase strength and then reduces that strength based on repeatability patterns, keyboard patterns, and several weak passphrase tests.

There is a javascript version of the algorithm <a href="https://github.com/broppler/password-entropy">here</a>.

##Install
```console
$ gem install ruby-entropy
```
```ruby
gem 'ruby-entropy', '~> 0.2.0'
```

##Require
```ruby
require 'ruby-entropy'
```

##Use

```ruby
example = RubyEntropy.new('correct horse battery staple')
```

```ruby
example.passphrase

# => correct horse battery staple
```


```ruby
example.strength

# => 77.27
```


###Blacklisted words and phrases (0.2.0+)
Ruby Entropy maintains a short list of blacklisted words and phrases.  If you want to add a blacklisted word or phrase e.g., your website name, you can add it like so:

```ruby
RubyEntropy.blacklist_passphrase('correct')g
```

```ruby
example.strength

# => 57.95
```