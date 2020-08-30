README

## DigitalContact/デジタル連絡帳


## アプリ紹介


##### 主な機能


## インストール使用まで
#### 1. Git-Hubからクローンする。
`$ git clone `
#### 2. bundleをインストールする。
`$ bundle install`
#### 3. データベースを作る。
`$ rails db:create`
#### 4. マイグレーションをする。
`$ rails db:migrate`
#### 5. 初期データを入れる。
`$ rails db:seed`
#### 6. ローカルサーバーを起動する。
`$　rails s`
#### 7. ブラウザに表示。
[http://localhost:3000/]をたたく。

## バージョン
ruby 2.6.5  
Rails 6.0.3.2  
mysql  

## データベース設計
##schoolsテーブル
|Colum|Type|Options|
|-----|----|-------|
|school_name|string|null:false|
|school_admin|integer|null:false|
|email|string|null:false, unique:true|
|password|string|null:false, unique:true|

###Association
- has_many :users
- has_many :rooms


##roomsテーブル
|Colum|Type|Options|
|-----|----|-------|
|number|string|null:false|
|grade|integer|null:false|
|school_id|references|null:false, foreign_key: true|

###Association
- belongs_to :school
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
|school_id|references|null:false, foreign_key: true|
|admin|boolean|default: false|

###Association
- belongs_to :room
- has_many :absent_contacts


##absent_contactsテーブル
|Colum|Type|Options|
|-----|----|-------|
|arised_at|date|null:false|
|absent_kind|integer|null:false|
|reason|text|null:false|
|room_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|

###Association
- belongs_to :room
- belongs_to :user


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