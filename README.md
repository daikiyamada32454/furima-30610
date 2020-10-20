
## users テーブル
| Column      | Type    | Option     |
| ----------- | ------- | ---------- |
| nickname    | string  | null:false |
| family_name | string  | null:false |
| first_name  | string  | null:false |
| birth_year  | integer | null:false |
| birth_month | integer | null:false |
| birth_day   | integer | null:false | 

## Association
- has_many :items
- has_many :buy

## items
| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| name            | string  | null:false |
| Description     | string  | null:false |
| Category        | string  | null:false |
| Status          | string  | null:false |
| Delivery charge | string  | null:false |
| sender          | string  | null:false |
| Delivery_date   | string  | null:false |
| price           | integer | null:false |
| fee             | integer |            |
| Profit          | integer |            |

## Association
- belongs_to :users
- has_one :buy

## buy
| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| credit          | integer | null:false |
| post_number     | integer | null:false |
| Prefectures     | sting   | null:false |
| Municipality    | string  | null:false |
| address         | integer | null:false |
| phone_number    | integer | null:false |

## Association
belongs_to :users
belongs_to :items