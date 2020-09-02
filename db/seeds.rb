School.create(
  school_name: '例第一小学校',
  school_admin: '例田試郎',
  email: 'true+placeholder=email.value=guestschool@gmail.com',
  password: '9LjqWY4ikaHIAj8Yn+7QxuHDNZ/5nVeihfdaDFJIE8yxf2JUwIuGdwPia83ie8JCZV+c3T15YoFmr/cJcEf78Kz+4UJno6w'
)

require "csv"
CSV.foreach('db/csv/rooms.csv', headers: true) do |row|
  Room.create(
    number: row['number'],
    grade: row['grade'],
    school_id: row['school_id']
  )
end

12.times do |number|
  month = number + 1
  28.times do |num|
    day = num + 1
    ContactBook.create(
      date: "2020/#{month}/#{day}",
      letter: 1,
      bring: "筆箱",
      schedule: "国　算　理　社　体　総",
      homework: "漢字練習No#{number + day}",
      inform: "テストします",
      room_id: 1
    )
  end
end

# 12.times do |number|
#   month = number + 1
#   day = number + 1
#   Letter.create(
#     released_at:"2020/#{month}/#{day + 7}",
#     name: "#{month}月学年だより",
#     pdf: open('db/pdf/pdfsample.pdf'),
#     room_id: 1
#   )
# end

User.create(
  :parent_name => "ゲスト先生",
  :child_name => "ゲスト先生",
  :email => "true+placeholder=email.locals=true.value=guestteacher@gmail.com",
  :password => "9LjqWY4ikaHIAj8Yn+7QxuHDNZ/5nveihfdaDFJIE8yxf2JUwIuGdwPia83ie8JCZV+c3T15YoFmr/cJcEf78Kz+4UJno6w",
  :school_id => 1,
  :room_id => 1,
  :admin => 1
)
User.create(
  :parent_name => "ゲスト保護者",
  :child_name => "ゲスト子ども",
  :email => "true+placeholder=email.locals=true.value=guestparent@gmail.com",
  :password => "9LjqWY4ikaHIAj8Yn+7QxuHDNZ/5nVeihfdaDFJIE8yxf2JUwIugdwPia83ie8JCZV+c3T15YoFmr/cJcEf78Kz+4UJno6w",
  :school_id => 1,
  :room_id => 1,
  :admin => 0  
)

13.times do |room|
  room
  nextroomid = room += 1
  30.times do |user|
    nextroom = room*30
    User.create(
      :parent_name => "保護者ユーザー#{( room * 30 ) + ( user + 1 )}",
      :child_name => "子どもサンプル#{( room * 30 ) + ( user + 1 )}",
      :email => "parent#{( room * 30 ) + ( user + 1 )}@gmail.com",
      :password => "parent#{( room * 30 ) + ( user + 1 )}",
      :room_id => "#{nextroomid}",
      :school_id => 1,
      :admin => 0  
    )
  end
end

12.times do |number|
  month = number + 1
  day = number + 1
  3.times do |num|
    AbsentContact.create(
      absent_at: "2020/#{month}/#{day+7}",
      kind: 1,
      reason: "体調不良のため",
      after_contact: true,
      t_checked: 0,
      room_id: 1,
      user_id: "#{number += 2}"
    )
  end
end