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
- has_many :room_months
- has_many :months, through: :room_months


##usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false, unique:true|
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
- belongs_to :month


##lettersテーブル
|Colum|Type|Options|
|-----|----|-------|
|title|text|null:false|
|file|string|null:false|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :month


##monthsテーブル
|Colum|Type|Options|
|-----|----|-------|
|month|integer|null:false, unique:true|

###Association
- has_many :room_months
- has_many :rooms, through: :room_months
- has_many :contact_books
- has_many :letters


##room_monthsテーブル
|Colum|Type|Options|
|-----|----|-------|
|month|integer|null:false, unique:true|

###Association
- belongs_to :room
- belongs_to :month


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
