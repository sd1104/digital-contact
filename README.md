## DigitalContact/デジタル連絡帳
小学校で教師と保護者間で行われる欠席の連絡にまつわる問題を解決するために作ったアプリです。

## アプリ開発背景
##### 前提（小学校で子どもが欠席することになったら）
- 欠席連絡は次の２つの方法のいずれかによって行われる
  - 保護者が電話で口頭連絡。
  - 連絡帳による文通形式。近所の子どもに連絡帳を預けて届けてもらう。

##### 欠席連絡問題（保護者と教室にとって現状どのような問題が発生しているか）
![スクリーンショット 2020-08-30 22 12 13](https://user-images.githubusercontent.com/67669319/91659939-e3f7ee00-eb0d-11ea-9eda-bf51ec3c66ab.png)
結果、保護者、教師ともに多くの時間と労力を取られている。  
さらに、教師が連絡帳を預け忘れたり、保護者が電話に出られずに、連絡がうまく伝わらない場合もある。

##### 問題の解決方法
- 欠席の連絡をWEB上で行えるようにする。
- その日の連絡帳と手紙をWEB上で閲覧できるようにする。

## 主な機能
#### 1. 学校としてログインした場合
![スクリーンショット 2020-08-30 22 30 51](https://user-images.githubusercontent.com/67669319/91660415-b1032980-eb10-11ea-9690-e0ebd205907d.png)
#### 2. 保護者・先生としてログインした場合。
- userのadminカラムがtrueの場合が教師、falseの場合は保護者となる。  
- 保護者としてログインした場合と教師としてログインした場合で表示内容や機能が分かれる。  
- 保護者は携帯で使うことが多いと考えレスポンシブデザインになっている。教師はPC利用のみを想定している（勤務中に個人の携帯を使うことができないため）。
![スクリーンショット 2020-08-30 22 33 10](https://user-images.githubusercontent.com/67669319/91660438-d132e880-eb10-11ea-968b-21d05b7f79cc.png)

## ローカルで使用する場合
#### 1. Git-Hubからクローンする。
`$ git clone https://github.com/sd1104/digital-contact.git`
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
[ローカルサーバー起動][http://localhost:3000/]

## バージョン
ruby 2.6.5  
Rails 6.0.3.2  
mysql  

<!-- ## データベース設計
### schoolsテーブル
|Colum|Type|Options|
|-----|----|-------|
|school_name|string|null:false|
|school_admin|integer|null:false|
|email|string|null:false, unique:true|
|password|string|null:false, unique:true|

#### Association
- has_many :users
- has_many :rooms


### roomsテーブル
|Colum|Type|Options|
|-----|----|-------|
|number|string|null:false|
|grade|integer|null:false|
|school_id|references|null:false, foreign_key: true|

#### Association
- belongs_to :school
- has_many :users
- has_many :absent_contacts
- has_many :contact_books
- has_many :letters


### usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|p_name|string|null:false|
|c_name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false, unique:true|
|room_id|references|null:false, foreign_key: true|
|school_id|references|null:false, foreign_key: true|
|admin|boolean|default: false|

#### Association
- belongs_to :room
- has_many :absent_contacts


### absent_contactsテーブル
|Colum|Type|Options|
|-----|----|-------|
|arised_at|date|null:false|
|absent_kind|integer|null:false|
|reason|text|null:false|
|room_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|

#### Association
- belongs_to :room
- belongs_to :user


### contact_booksテーブル
|Colum|Type|Options|
|-----|----|-------|
|date|datetime|null:false|
|letter|integer||
|bring|text||
|schedule|text||
|homework|text||
|inform|text||
|room_id|references|null:false, foreign_key: true|

#### Association
- belongs_to :room


### lettersテーブル
|Colum|Type|Options|
|-----|----|-------|
|release_at|date|null:false|
|name|text|null:false|
|pdf|string|null:false|
|room_id|references|null:false, foreign_key: true|

#### Association
- belongs_to :room -->