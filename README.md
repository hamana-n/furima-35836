## groups_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| email   | string | null: false |
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
| item_name   | string | null: false |
| detail  | text | null: false |
| category_id   | integer | null: false |
| status_id   | integer | null: false |
| burden_of_shipping_charge_id   | integer | null: false |
| shipping_area_id  | integer | null: false |
| days_to_ship_id   | integer | null: false |
| price   | integer | null: false |
| user   | reference |  |


### Association
- belongs_to :user
- has_one :purchase_record



## purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | reference |  |
| user   | reference |  |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_address



## shipping_addressesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| Postal_code   | string | null: false |
| shipping_area_id  | integer | null: false |
| Municipality   | string | null: false |
| address   | string | null: false |
| Building_name  | string |  |
| phone_number   | string | null: false |
| purchase_record   | reference |  |

### Association
- belongs_to :purchase_record
