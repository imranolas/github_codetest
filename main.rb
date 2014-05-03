require_relative 'environment'

puts `clear`

def menu
  puts 'To find a github users favourite language, please enter their username below:'
  print '>'
  gets.chomp.downcase
end

until (response = menu) == 'q'
    puts "#{response}'s favourite language is #{User.new(response).favourite_language}"
end