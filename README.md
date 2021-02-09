# README
## users table  <!-- ユーザー情報 -->

| Column            | Type   | Options                   |
| ------------------| ------ | --------------------------|
| nickname          | string | null: false               | <!-- ニックネーム   -->
| email             | string | null: false, unique: true | <!-- メールアドレス  -->
| encrypted_password| string | null: false               | <!-- パスワード     -->
| first_name        | string | null: false               | <!-- 名前          -->
| last_name         | string | null: false               | <!-- 苗字          -->
| first_name_kana   | string | null: false               | <!-- 名前（かな）   -->
| last_name_kana    | string | null: false               | <!-- 苗字 (かな)   -->
| birth_date        | date   | null: false               | <!-- 生年月日(年)   -->

### Association
has_many :items
has_many :orders

## items table <!-- 商品情報 -->

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| product_name     | string     | null: false | <!-- 商品名       -->
| explanation      | text       | null: false | <!-- 商品の説明    -->
| category_id      | integer    | null: false | <!-- カテゴリー    -->
| state_id         | integer    | null: false | <!-- 商品の状態    -->
| burden_id        | integer    | null: false | <!-- 発送料の負担   -->
| area_id          | integer    | null: false | <!-- 発送元の地域   -->
| day_id           | integer    | null: false | <!-- 発送までの日数 -->
| price            | integer    | null: false | <!-- 販売価格      -->
| user             | references | null: false,foreign_key: true| <!-- ユーザー情報の外部キー  -->

### Association
belongs_to :user
has_one :buy

## orders table <!-- 購入記録 -->

| Column           | Type       | Options              |  
| -----------------| -----------| ---------------------|
| user             | references | foreign_key: true    | <!-- ユーザー情報の外部キー  -->
| item             | references | foreign_key: true    | <!-- 商品情報の外部キー     -->

### Association
belongs_to :user
belongs_to :item
has_one :address

## address table <!-- 配達先住所 -->

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| postal_code      | string     | null: false | <!-- 郵便番号 -->
| area_id          | integer    | null: false | <!-- 都道府県 -->
| municipality     | string     | null: false | <!-- 市区町村 -->
| address          | string     | null: false | <!-- 番地    --> 
| building         | string     |             | <!-- 建物名  -->
| phone_number     | string     | null: false | <!-- 電話番号 -->
| order            | references |  foreign_key: true     | <!-- 購入記録の外部キー  -->

### Association
belong_to :order
