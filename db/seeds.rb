# require "csv"

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/monthData.csv') do |row|

#   Month.create(:month => row[0])

# end

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/roomData.csv') do |row|

#   Room.create(:number => row[0])

# end

# CSV.foreach('/Users/satouhiroshi/projects/digital-contact/db/contact_book-sampleData2.csv') do |row|

#   ContactBook.create(:date => row[0], :letter => row[1], :bring => row[2], :schedule => row[3], :homework => row[4], :inform => row[5], :month_id => row[6])

# end