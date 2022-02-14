# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | unique: true, null: false     |
| email              | string     | unique: true, null: false     |
| encrypted_password | string     | null: false                   |
| gender             | string     | null: false                   |
| birthday           | date       | null: false                   |
| fridge             | references | null: true, foreign_key: true |

### Association

- belongs_to :fridge
- has_many :shoppings

## fridges テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string |             |

### Association

- has_many :users
- has_many :items
- has_many :shoppings

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| regular          | integer    | null: false                    |
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| amount_id        | integer    | null: false                    |
| exp_date         | date       | null: false                    |
| fridge           | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- has_many :losses
- has_many :shoppings
- has_many :shopping_items

## shoppings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| shopping_date    | date       | null: false                    |
| fridge           | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- belongs_to :user
- has_many :items
- has_many :shopping_items 

## shopping_items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shopping      | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

### Association

- belongs_to :shopping
- belongs_to :item

## losses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| loss_date     | date       | null: false                    |
| fridge        | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- belongs_to :item