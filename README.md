## groups_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false |
| email   | string | null: false unique: true |
| encrypted_password  | string | null: false |
| first_name   | string | null: false |
| last_name   | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana   | string | null: false |
| birthday   | date | null: false |

### Association
- has_many :items
- has_many :purchase_records



## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string | null: false |
| detail  | text | null: false |
| category_id   | integer | null: false |
| status_id   | integer | null: false |
| burden_of_shipping_charge_id   | integer | null: false |
| shipping_area_id  | integer | null: false |
| days_to_ship_id   | integer | null: false |
| price   | integer | null: false |
| user   | reference | foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record



## purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | reference | foreign_key: true |
| user   | reference | foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_address



## shipping_addressesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code   | string | null: false |
| shipping_area_id  | integer | null: false |
| municipality   | string | null: false |
| address   | string | null: false |
| building_name  | string |  |
| phone_number   | string | null: false |
| purchase_record   | reference | foreign_key: true |

### Association
- belongs_to :purchase_record
