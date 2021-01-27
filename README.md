# DB設計

##  usersテーブル

|     Colum          | Type   | Option                    |
| -------------------|--------|---------------------------| 
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |             |
| encrypted_password | string | null: false               |
| last_name_zenkaku  | string | null: false               |
| first_name_zenkaku | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items

| Colum       | Type          | Option            |
|-------------|---------------|-------------------|
| name        | string        | null: false       |
| explanation | text          | null: false       |
| category_id | integer       | null: false       |
| state_id    | integer       | null: false       |
| borden_id   | integer       | null: false       |
| area_id     | integer       | null: false       | 
| day_id      | integer       | null: false       |
| price       | integer       | null: false       |
| user        | references    | foreign_key: true |

### ActiveStorage

- belongs_to :user
- has_one :order

## orders

| Colum | Type       | Option            |
|-------|------------|-------------------|
| user  | references | foreign_key: true |
| item  | references | foreign_key: true |

### ActiveStorage

- belongs_to :user
- belongs_to :item
- has_one :address

## address

| Colum        | Type       | Option            |
|--------------|------------|-------------------|
| postal_code  | string     | null: false       |
| area_id      | integer    | null: false       |
| municipality | string     | null: false       |
| address      | string     | null: false       |
| building     | string     | null: true        |
| phone_number | string     | null: false       |
| user         | references | foreign_key: true |

### ActiveStorage

- belongs_to :order