json.array! @future_absent_contacts_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end

json.array! @future_absent_contacts_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end

json.array! @past_absent_contacts_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end

json.array! @past_absent_contacts_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end

json.array! @today_absent_contact_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end

json.array! @today_absent_contact_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind user.kind
  json.reason user.reason
  json.after_contact user.after_contact
  json.room_id user.room_id
  json.user_id user.user_id
end
