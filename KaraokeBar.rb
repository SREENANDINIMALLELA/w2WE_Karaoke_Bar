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



  # if room in bar palys the guest fav_song
  def if_guest_fav_song_played(room)
    room_song_title_list =room.title_of_songs()
     guest_fav_song_list = room.guests_fav_song_list()
    for song in guest_fav_song_list
      room_song_title_list.find{|room_song| room_song ="song"}
      return "whoo!"
    end
  end
end
