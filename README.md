# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.6.5
* System dependencies

* Configuration

* Database creation

##roomsテーブル
|Colum|Type|Options|
|-----|----|-------|
|number|string|null:false, unique:true|

###Association
- has_many :users
- has_many :absent_contacts
- has_many :contact_books
- has_many :letters


##usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|p_name|string|null:false|
|c_name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false, unique:true|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room


##absent_contactsテーブル
|Colum|Type|Options|
|-----|----|-------|
|arised_at|date|null:false|
|absent_kind|integer|null:false|
|reason|text|null:false|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room


##contact_booksテーブル
|Colum|Type|Options|
|-----|----|-------|
|date|datetime|null:false|
|letter|integer||
|bring|text||
|schedule|text||
|homework|text||
|inform|text||
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room


##lettersテーブル
|Colum|Type|Options|
|-----|----|-------|
|release_at|date|null:false|
|name|text|null:false|
|pdf|string|null:false|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room


##absent_contactsテーブル
|Colum|Type|Options|
|-----|----|-------|
|arised_at|date|null:false|
|absent_kind|integer|null:false|
|reason|text|null:false|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
