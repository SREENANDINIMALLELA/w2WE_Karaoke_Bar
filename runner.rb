require("minitest/autorun")
require("minitest/rg")
require_relative("KaraokeBar.rb")
require_relative("Song.rb")
require_relative("Guest.rb")
require_relative("Room.rb")
 puts "clear"
 puts "Who are you?"
user_input = gets.chomp()
if user_input == "Admin"
  puts "Enter your username :"
  username = gets.chomp()
  puts "Enter your password :"
  password = gets.chomp()
  puts " Congratulations , You are successfully login to the KaraokeBar "
  puts "Hi #{username} what do you want to do today? "
  puts "1 for Guest Management "
  puts "2 for Songs Management "
  puts "3 for Rooms Management "
  admin_action = gets.chomp()
  guest = Guest.new(name,cash,first_intrest_in,second_intrest_in)
  if admin_action == 1
    puts "1 for Check-in guest"
    puts "2 for check-out guest"
      user = gets.chomp()
       if user == 1
         puts "Please enter guest name1"
          name = gets.chomp()
         puts "Please enter the cash you have to pay entree fee "
         cash = gets.chomp()
         puts " Enter 1 for Melody music "
         puts " Enter 2 for Romantic music "
         puts " Enter 3 for rocking rock lovers "

         puts "Enter the first intrest room "
          first_intrest_in= gets.chomp

         puts "Enter second intrested room"
         second_intrest_in=gets.chomp



         #Please enter guest and room he is in interested in
         # uday , meloy-room3

         bar.checkin(guest.new("uday", get_melody_lover_playlist)





else
    puts "Sorry , others are not allowed to login"
end
