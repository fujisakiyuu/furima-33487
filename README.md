# README
## users table  <!-- ユーザー情報 -->

| Column            | Type   | Options     |
| ------------------| ------ | ----------- |
| nickname          | string |  not null   | <!-- ニックネーム   -->
| email             | string |  not null   | <!-- メールアドレス  -->
| encrypted_password| string |  not null   | <!-- パスワード     -->
| first_name        | string |  not null   | <!-- 名前          -->
| last_name         | string |  not null   | <!-- 苗字          -->
| first_name_kana   | string |  not null   | <!-- 名前（かな）   -->
| last_name_kana    | string |  not null   | <!-- 苗字 (かな)   -->
| birth_date        | date   |  not null   | <!-- 生年月日(年)   -->

### Association
hus_many :items
hus_many :buys

## items table <!-- 商品情報 -->

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| product_name     | string     |  not null   | <!-- 商品名       -->
| explanation      | text       |  not null   | <!-- 商品の説明    -->
| category_id      | integer    |  not null   | <!-- カテゴリー    -->
| state_id         | integer    |  not null   | <!-- 商品の状態    -->
| burden_id        | integer    |  not null   | <!-- 発送料の負担   -->
| area_id          | integer    |  not null   | <!-- 発送元の地域   -->
| days_id          | integer    |  not null   | <!-- 発送までの日数 -->
| price_id         | integer    |  not null   | <!-- 販売価格      -->
| user_id          | references | null: false,foreign_key: true| <!-- ユーザー情報の外部キー  -->

### Association
belongs_to :user
has_one :buy

## buys table <!-- 購入記録 -->

| Column           | Type       | Options              |  
| -----------------| -----------| ---------------------|
| user_id          | references | foreign_key: true    | <!-- ユーザー情報の外部キー  -->
| item_id          | references | foreign_key: true    | <!-- 商品情報の外部キー     -->

### Association
belongs_to :user
belongs_to :item
has_one :street_address

## street_address table <!-- 配達先住所 -->

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| postal_code      | string     |  not null   | <!-- 郵便番号 -->
| area_id          | integer    |  not null   | <!-- 都道府県 -->
| municipality     | string     |  not null   | <!-- 市区町村 -->
| address          | string     |  not null   | <!-- 番地    --> 
| building         | string     |             | <!-- 建物名  -->
| phone_number     | string     |  not null   | <!-- 電話番号 -->
| buy_id           | references |  foreign_key: true     | <!-- 購入記録の外部キー  -->

### Association
belong_to :buy
