
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
- has_many :after_buys

## items
| Column             | Type      | Option                        |
| ------------------ | --------- | ----------------------------- |
| user               |references | null:false, foreign_key: true |
| name               | string  | null:false                      |
| description        | text    | null:false                      |
| category_id        | integer | null:false                      |
| status_id          | integer | null:false                      |
| delivery_charge_id | integer | null:false                      |
| sender_id          | integer | null:false                      |
| delivery_date_id   | integer | null:false                      |
| price              | integer | null:false                      |

## Association
- belongs_to :user
- has_one :after_buy

## street_addresses
| Column             | Type      | Option                        |
| ------------------ | --------- | ----------------------------- |
| post_number        | string    | null:false                    |
| prefectures_id     | integer   | null:false                    |
| municipality       | string    | null:false                    |
| building_name      | string    |                               |
| address            | string    | null:false                    |
| phone_number       | string    | null:false                    |
| after_buy          | reference | null:false, foreign_key: true |


## Association
- belongs_to :after_buy

## after_buysテーブル
| Column       | Type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| user         | references | null:false, foreign_key: true |
| item         | references | null:false, foreign_key: true | 

## Association
- belongs_to :user
- belongs_to :item
- has_one :street_address