# DB設計

##  usersテーブル

|     Colum    | Type   | Option      |
| -------------|--------|-------------| 
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name_zenkaku | string | null: false |
| name_kana    | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :items
- has_many :orders

## items

| Colum       | Type          | Option      |
|-------------|---------------|-------------|    
| image       | ActiveStorage | null: false |
| name        | string        | null: false |
| explanation | text          | null: false |
| details     | string        | null: false |
| delivery    | string        | null: false |
| price       | string        | null: false |

### ActiveStorage

- belongs_to :user

## orders

| Colum            | Type   | Option      |
|------------------|--------|-------------|
| card_information | Pay.JP | null: false |
| shipping_address | string | null: false |

### ActiveStorage

- belongs_to :user
