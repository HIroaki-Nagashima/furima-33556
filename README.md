# DB設計

##  usersテーブル

|     Colum          | Type   | Option      |
| -------------------|--------|-------------| 
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_zenkaku  | string | null: false |
| first_name_zenkaku | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items

| Colum       | Type          | Option            |
|-------------|---------------|-------------------|
| name        | string        | null: false       |
| explanation | text          | null: false       |
| category    | string        | null: false       |
| state       | string        | null: false       |
| borden      | string        | null: false       |
| area        | string        | null: false       | 
| days        | string        | null: false       |
| price       | string        | null: false       |
| user        | references    | foreign_key: true |

### ActiveStorage

- belongs_to :user

## orders

| Colum | Type      | Option            |
|-------|-----------|-------------------|
| user  |references | foreign_key: true |

### ActiveStorage

- belongs_to :user
- has_one :address

## address

| Colum        | Type       | Option            |
|--------------|------------|-------------------|
| postal_code  | string     | null: false       |
| municipality | string     | null: false       |
| address      | string     | null: false       |
| building     | string     | null: true        |
| phone_number | string     | null: false       |
| user         | references | foreign_key: true |

### ActiveStorage

-belongs_to :order