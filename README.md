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
- has_many :contact_books
- has_many :letters


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
|title|text|null:false|
|room_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room

##contact_books_monthesテーブル
|Colum|Type|Options|
|-----|----|-------|
|month|integer|null:false, unique:true|

###Association
- has_many :contact_books

##letters_monthesテーブル
|Colum|Type|Options|
|-----|----|-------|
|month|integer|null:false, unique:true|

###Association
- has_many :letters


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
