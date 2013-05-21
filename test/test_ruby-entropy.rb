require_relative '../lib/ruby-entropy.rb'

tst = Password.new("avocado avocado avocado")
sky = Password.new("the force is lucid on westward mornings")
wrd = Password.new("trustno1")
key = Password.new('asdfgh')
num = Password.new("12345neko!")
rep = Password.new("123aaa#B")
cmn = Password.new("@dm!n|strat0r's p@5$w0rd")

puts '====TESTS===='

puts "test 1: #{tst.strength == 7.12}"
puts "test 2: #{sky.strength == 87.54}"
puts "test 3: #{wrd.strength == 17.22}"
puts "test 4: #{key.strength == 11.28}"
puts "test 5: #{num.strength == 23.26}"
puts "test 6: #{rep.strength == 20.93}"
puts "test 7: #{cmn.strength == 55.25}"