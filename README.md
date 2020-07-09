# README

hello

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## users table
|Colm|Type|Option|
|----|----|------|
|nickname|string|null: false,unique: true,index: true|
|email|integer|null: false,unique: true|
|password|integer|null: false|
|password_confirm|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|

### Association
- has_one :adresses dependent: :destroy
- has_one :credit_cards dependent: :destroy
- has_many :items dependent: :destroy
- has_many :comments
- has_many :likes




## adresses table
|Colm|Type|Option|
|----|----|------|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|
|phone_number|string|null: false|
|user_id|references|null: false,foreignkey: true|

### Association
- belongs_to :user



## credit_card table
|Colm|Type|Option|
|----|----|------|
|coutomer_id|string|null: false|
|card_id|string|null:false|
|user_id|references|null: false|foreignkey: true|

### Association
- belongs_to :user



## itemes table
|Colm|Type|Option|
|----|----|------|
|item_name|string|null: false|
|detail|text|
|condition|integer|null: false,default: 0|
|delivery_fee|string|null: false|
|shippig_area|integer|null: false|
|delivery_time|string|null: false|
|price|integer|null:false|
|user_id|references|null:false,foreignkey: true|
|brand_id|string|
|category_id|references|null:false,foreignkey: true|
|buyer_id|references|foreignkey: true|


### Association
- belongs_to :user
- belongs_to :category
- has_many :images dependent: :destroy
- has_many :comments
- has_many :likes



## images table
|src|string|null: false|
|item_id|references|null: false,foreignkey: true|

### Association
- belongs_to :item



## categories table
|Colm|Type|Option|
|----|----|------|
|name|string|null: false|
|ancestry|string|index:true|


### Association
- has_many :items 



## comment
|Colm|Type|Option|
|----|----|------|
|text|text|
|user_id|references|null:false,foreignkey: true|
|item_id|references|null: false,foreignkey: true|


### Association
-belongs_to :item
_belongs_to :user



## likes
|Colm|Type|Option|
|----|----|------|
|user_id|references|null:false,foreignkey: true|
|item_id|references|null: false,foreignkey: true|


### Association
-belongs_to :item
_belongs_to :user