## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | string | null: false |

### Association

- has_many :items
- has_one :destination
- has_one :caed


## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| image         | string | null: false |
| name          | string | null: false |
| description   | string | null: false |
| category      | string | null: false |
| condition     | string | null: false |
| shipping_cost | string | null: false |
| prefecture    | string | null: false |
| shipping_day  | string | null: false |
| price         | string | null: false |

### Association

- belongs_to :user
- belongs_to :destination


## destination テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| post_cord    | string | null: false |
| prefecture   | string | null: false |
| city         | string | null: false |
| address      | string | null: false |
| building     | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :user
- has_many :items


## destination テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| number     | string | null: false |
| expiration | string | null: false |
| card       | string | null: false |

### Association

- belongs_to :user

