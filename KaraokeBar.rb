# require('pry')
class KaraokeBar

  attr_reader :guests, :rooms  ,:songs , :bar_revenue ,:drink
  def initialize( guests, rooms  ,songs ,drink ,bar_revenue)
    @guests = guests
    @rooms= rooms
    @songs = songs
    @drink = drink
    @bar_revenue = bar_revenue
  end

  #get total guests in all rooms
  def total_guests_in_rooms()
    guests_in_bar = 0
    for room in @rooms
      guests_in_bar += room.guests_in_room()
    end
    return guests_in_bar
  end

  def login()

  end


  #gets total bar revenue on all rooms
  def bar_revenue()
    for room in @rooms
      @bar_revenue +=room.revenue()
    end
    return @bar_revenue
  end
  def display_spaces_availability()
    display_spaces = Hash.new()
    @rooms.each{|room| display_spaces[room.type] = room.spaces_available}
    return display_spaces
  end
  #
  #   def check_in(guest)
  #     preferred_room = nil
  #     @rooms.each{|room| if ( room.type()== guest.first_intrest_in &&room.spaces_available != 0 )
  #       p  preferred_room = room
  #
  #     else (room.type()== guest.second_intrest_in && room.spaces_available != 0)
  #       p  preferred_room = room
  #     end }
  # p   preferred_room
  #
  #       if preferred_room != nil
  #         return checkin_process(guest ,preferred_room)
  #       else
  #         return  "All rooms are filled  #{display_spaces_availability()}"
  #       end
  #     end
  def check_in(guest)
    preferred_room = nil
    @rooms.find{|room|
      if ( room.type()== guest.first_intrest_in &&room.spaces_available != 0 )
        p preferred_room = room
        return checkin_process(guest ,preferred_room)

      elsif (room.type()== guest.second_intrest_in && room.spaces_available != 0)
        preferred_room = room
        return  checkin_process(guest ,preferred_room)
      elsif   preferred_room != nil
        return  "All rooms are filled  #{display_spaces_availability()}"
      end }
  end



    # if room in bar palys the guest fav_song
    def if_guest_fav_song_played(room)
      room_song_title_list =room.title_of_songs()
      guest_fav_song_list = room.guests_fav_song_list()
      for song in guest_fav_song_list
        room_song_title_list.find{|room_song| room_song ="song"}
        return "whoo!"
      end
    end



    def checkin_process(guest ,room)
      # binding.pry
      if  guest.wallet() >= room.entry_fee
        check_in = true
        room.guests << guest
        room.reduce_space_availability()
        p  room.entry_fee
        room.add_revenue(room.entry_fee)
        p room.entry_fee
        return " #{guest.name()} checked-in to the #{room.type()}"
      end

    end

    # add_revenue(@entry_fee)
    def check_out(guest)
      for room in @rooms
        checkout_process(guest,room)
      end
    end
    def checkout_process(guest,room)
      room.guests.delete(guest)
      room.revenue
      check_out = true
    end
    def total_rooms_available()
      rooms_available =0
      @rooms.each{|room| rooms_available += room.spaces_available()}
      return rooms_available
    end
  end
