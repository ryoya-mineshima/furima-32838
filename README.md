## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record


## destination テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_cord       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record


##  purchase_recordテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

