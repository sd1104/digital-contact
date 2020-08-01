json.array! absent_contacts do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @future_absent_contacts_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @future_absent_contacts_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @past_absent_contacts_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @past_absent_contacts_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @today_absent_contact_for_parent do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end

json.array! @today_absent_contact_for_teacher do |absent_contact|
  json.absent_at absent_contact.absent_at
  json.kind absent_contact.kind
  json.reason absent_contact.reason
  json.after_contact absent_contact.after_contact
  json.room_id absent_contact.room_id
  json.user_id absent_contact.user_id
  json.t_checked absent_contact.t_checked
end
