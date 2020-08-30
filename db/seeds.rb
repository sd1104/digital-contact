# 276.times do |num|
#   User.create(
#     :parent_name => "parent#{num+126}",
#     :child_name => "child#{num+126}",
#     :email => "parent#{num+126}@gmail.com",
#     :password => "parent#{num+126}",
#     :school_id => 1,
#     :admin => 0  
#   )
# end

10.times do |number|
  30.times do |num|
    RoomUser.create(
      :room_id => number+3,
      :user_id => num + ( (number+3) * 30 + 1 )  
    )
  end
end