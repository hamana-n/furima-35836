## groups_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| email   | string | null: false |
| password  | string | null: false |
| passwordconfirm  | string | null: false |
| firstname   | string | null: false |
| lastname   | string | null: false |
| firstnamekana   | string | null: false |
| lastnamekana   | string | null: false |
| birthday   | datetime | null: false |

### Association
- has_many :items
- has_many :purchase_records



## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| itemname   | string | null: false |
| detail  | text | null: false |
| category   | string | null: false |
| status   | string | null: false |
| burden of shipping charges   | string | null: false |
| shipping area  | string | null: false |
| days to ship   | datetime | null: false |
| price   | integer | null: false |
| user   | reference |  |


### Association
- belongs_to :users
- has_one :purchase_records



## purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card number   | string | null: false |
| expiration date  | datetime | null: false |
| Security code   | string | null: false |
| item   | reference |  |


### Association
- belongs_to :items
- has_one :shipping_addresses



## shipping_addressesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| Postal code   | string | null: false |
| Prefectures  | string | null: false |
| Municipality   | string | null: false |
| address   | string | null: false |
| Building name  | string | null: false |
| phone number   | string | null: false |
| purchase_record   | reference |  |

### Association
- belongs_to :purchase_records
