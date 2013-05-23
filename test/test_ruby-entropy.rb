require_relative '../lib/ruby-entropy.rb'

tst = RubyEntropy.new("avocado avocado avocado")
sky = RubyEntropy.new("the force is lucid on westward mornings")
wrd = RubyEntropy.new("trustno1")
key = RubyEntropy.new('asdfgh')
num = RubyEntropy.new("12345neko!")
rep = RubyEntropy.new("123aaa#B")
cmn = RubyEntropy.new("@dm!n|strat0r's p@5$w0rd")

puts '====TESTS===='

puts "test 1: #{tst.strength == 7.12}"
puts "test 2: #{sky.strength == 87.54}"
puts "test 3: #{wrd.strength == 17.22}"
puts "test 4: #{key.strength == 11.28}"
puts "test 5: #{num.strength == 23.26}"
puts "test 6: #{rep.strength == 20.93}"
puts "test 7: #{cmn.strength == 55.25}"