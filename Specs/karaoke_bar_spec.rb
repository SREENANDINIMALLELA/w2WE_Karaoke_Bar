require("minitest/autorun")
require("minitest/rg")
require_relative("../KaraokeBar.rb")
require_relative("../Song.rb")
require_relative("../Guest.rb")
require_relative("../Room.rb")


class TestKaraokeBar< MiniTest::Test
  def setup()
    @song1 = Song.new("love you ","5 guys","devisri","Romantic music")
    @song2 = Song.new("chinna dana","ramulamma","kavi","Rock music" )
    @song3 = Song.new("rock and roll","rangasthala","teja","Melody music")
    @song4 = Song.new("you are my","5 guys","devisri"," Romantic music ")
    @song5 = Song.new("dhruva","charan","kavi", "Rock music")
    @song6 = Song.new("vinara vinara","rangasthala","teja","Melody music")
    @songs= [@song1 , @song2 , @song3,@song4,@song5,@song6 ]
    @room1= Room.new("Melody lovers", 2 ,50)
    @room2= Room.new("romantic lovers", 7 ,70)
    @room3= Room.new("rocking rock lovers", 3 ,100)
    @rooms =[@room1 , @room2,@room3]
    @guest1= Guest.new( " Sree" , 100 , "love you" , "Melody lovers")
    @guest2= Guest.new( "nand" , 1500 , "vinara vinara" , "Melody lovers")
    @guest3= Guest.new( "uday" , 150 , "bujji bujji", "romantic lovers")
    @guest4= Guest.new( "ved" , 150 , "chiinnn bujji", "Melody lovers")
    @guest5= Guest.new( "ved" , 150 , "chiinnn bujji", "Melody lovers")
    @karaokeBar =KaraokeBar.new(@guests,@rooms,@songs, @drink,1000)
  end
  # added three guests in different rooms and cheked the revenue of the bar , total guests in bar , revenue of the individual room

  def test_add_guests_to_bar()
    @room1.guest_checkin(@guest1)
    @room2.guest_checkin(@guest2)
    @room3.guest_checkin(@guest3)
    assert_equal(3 , @karaokeBar.total_guests_in_rooms())
    assert_equal( 50 , @room1.revenue())
    assert_equal( 70 , @room2.revenue())
    assert_equal( 100 , @room3.revenue())
    assert_equal(1 , @room1.capacity())
    assert_equal(1220 , @karaokeBar.bar_revenue())
  end
  # checking by adding more guests than the capacity of the room

  def test_guests_checkin()
    @room1.guest_checkin(@guest1)
    @room2.guest_checkin(@guest2)
    @room3.guest_checkin(@guest3)
    @room1.guest_checkin(@guest4)
    @room1.guest_checkin(@guest5)
    assert_equal(4, @karaokeBar.total_guests_in_rooms())
    assert_equal(100 , @room1.revenue())
    assert_equal( 70 , @room2.revenue())
    assert_equal( 100 , @room3.revenue())
    assert_equal(0 , @room1.capacity())
    assert_equal(1270 , @karaokeBar.bar_revenue())
  end
  def test_checkout()
    @room1.guest_checkin(@guest1)
    @room2.guest_checkin(@guest2)
    @room3.guest_checkin(@guest3)
    @room1.guest_checkout(@guest1)
    assert_equal(2, @karaokeBar.total_guests_in_rooms())
    assert_equal(50 , @room1.revenue())
    assert_equal(1 , @room1.capacity())
    assert_equal(1220 , @karaokeBar.bar_revenue())
  end
  def test_guest_fav_song_display()
    @room1.guest_checkin(@guest1)
    @room1.guest_checkin(@guest2)
    @room1.add_songs_to_room(@songs , "Melody music")
    assert_equal("whoo!"  , @karaokeBar.if_guest_fav_song_played(@room1))

  end


end
