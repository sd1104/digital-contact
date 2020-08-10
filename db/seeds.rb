# require "csv"

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/roomData.csv') do |row|

#   Room.create(:number => row[0])

# end

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/contact_book_sampleData.csv') do |row|

#   ContactBook.create(:date => row[0], :letter => row[1], :bring => row[2], :schedule => row[3], :homework => row[4], :inform => row[5], :room_id => row[6])

# end

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/userDataSample.csv') do |row|

#   User.create(:parent_name => row[0], :child_name => row[1], :email => row[2], :password => row[3])

# end