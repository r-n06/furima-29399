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
| birthday         | date    | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :address

## Itemsテーブル　

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipment_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Purchasesテーブル

| Column  | Type       | Options                        |
| ------ -| ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| prefecture_code_id | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| other              | text       | nill: false                    |
| building_name      | text       |                                |
| user               | references | null: false, foreign_key: true |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
