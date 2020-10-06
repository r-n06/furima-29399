# データベース設計

## Usersテーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| fist_name_kana   | string  | null: false |
| birthday_year    | string  | null: false |
| birthday_month   | string  | null: false |
| birthday_day     | string  | null: false |

### Association

- has_many :items
- has_many :purchases

## Itemsテーブル　

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| introduction  | text       | null: false                    |
| category      | text       | null: false                    |
| status        | text       | null: false                    |
| postage_payer | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipment_day  | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Purchasesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| prefecture-code    | integer    | null: false                    |
| address_prefecture | string     | null: false                    |
| address_ city      | string     | null: false                    |
| address_other      | text       | nill: false                    |
| building_name      | text       |                                |
| card_number        | integer    | nill: false                    |
| card_month         | integer    | nill: false                    |
| card_year          | integer    | nill: false                    |
| card_security_code | integer    | nill: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item