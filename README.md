
## users テーブル
| Column           | Type    | Option     |
| ---------------- | ------- | ---------- |
| nickname         | string  | null:false |
| family_name      | string  | null:false |
| family_name_kana | string  | null:false |
| first_name       | string  | null:false |
| first_name_kana  | string  | null:false |
| birthday         | date    | null:false |

## Association
- has_many :items
- has_many :buys

## items
| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| name            | string  | null:false |
| description     | text    | null:false |
| category        | integer | null:false |
| status          | integer | null:false |
| delivery charge | integer | null:false |
| sender          | integer | null:false |
| delivery_date   | integer | null:false |
| price           | integer | null:false |

## Association
- belongs_to :user
- has_one :buy

## buy
| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| post_number     | integer | null:false |
| prefectures     | sting   | null:false |
| municipality    | string  | null:false |
| address         | integer | null:false |
| phone_number    | string  | null:false |


## Association
belongs_to :user
belongs_to :item

## after_buyテーブル
| Column          | Type       | Option      |
| --------------- | ---------- | ----------- |
| user_id         | references | null:false, |
| item_id         | references | null:false, | 

## Association
- belongs_to :user
- belongs_to :item