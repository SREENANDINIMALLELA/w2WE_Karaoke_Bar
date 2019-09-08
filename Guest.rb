class Guest
  attr_reader :name , :wallet,:fav_song , :room_type
  def initialize( name  , wallet , fav_song, room_type)
    @name = name
    @wallet = wallet
    @fav_song=fav_song
    @room_type=room_type
  end

  # def check_in(rooms)
  #   rooms_left= rooms.rooms_available()
  #   if rooms_left != 0
  #     rooms_left -= 1
  #   end
  # end
end
