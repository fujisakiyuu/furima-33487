# README
## users table  <!-- ユーザー情報 -->

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string |  not null   | <!-- ニックネーム   -->
| email            | string |  not null   | <!-- メールアドレス  -->
| password         | string |  not null   | <!-- パスワード     -->
| first_name_kana  | string |  not null   | <!-- 名前          -->
| last_name_kana   | string |  not null   | <!-- 苗字          -->
| first_name_kana  | string |  not null   | <!-- 名前（かな）   -->
| last_name_kana   | string |  not null   | <!-- 苗字 (かな)   -->
| year             | string |  not null   | <!-- 生年月日(年)   -->
| month            | string |  not null   | <!-- 生年月日(月)   -->
| day              | string |  not null   | <!-- 生年月日(日)   -->

### Association
hus_many :items
hus_many :buys

## items table <!-- 商品情報 -->

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| image            | string |  not null   | <!-- 出品画像     -->
| product_name     | string |  not null   | <!-- 商品名       -->
| explanation      | string |  not null   | <!-- 商品の説明    -->
| category         | string |  not null   | <!-- カテゴリー    -->
| state            | string |  not null   | <!-- 商品の状態    -->
| burden           | string |  not null   | <!-- 発送料の負担   -->
| area             | string |  not null   | <!-- 発送元の地域   -->
| days             | string |  not null   | <!-- 発送までの日数 -->
| price            | string |  not null   | <!-- 販売価格      -->
| user_id          | foreign_key: true    | <!-- ユーザー情報の外部キー  -->

### Association
belongs_to :user
has_one :buy

## buys table <!-- 購入記録 -->

| Column           | Type   | Options     |  
| -----------------| ------ | ----------- |
| comment          | text   | null: false | <!-- コメント -->
| user_id          | foreign_key: true    | <!-- ユーザー情報の外部キー  -->
| item_id          | foreign_key: true    | <!-- 商品情報の外部キー     -->

### Association
belongs_to :user
belongs_to :item
has_one :street_address

## street_address table <!-- 配達先住所 -->

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| postal_code      | string |  not null   | <!-- 郵便番号 -->
| prefectures      | string |  not null   | <!-- 都道府県 -->
| municipality     | string |  not null   | <!-- 市区町村 -->
| address          | string |  not null   | <!-- 番地    --> 
| building         | string | null: false | <!-- 建物名  -->
| phone_number     | string |  not null   | <!-- 電話番号 -->
| buy_id           | foreign_key: true    | <!-- 購入記録の外部キー  -->

### Association
belong_to :buy
