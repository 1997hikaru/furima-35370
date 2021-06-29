# テーブル設計

## usersテーブル
| Column             | Type     | Options                    |
| --------           | -------- | --------                   |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true  |
| password           | string   | null: false                |
| last_name          | string   | null: false                |
| first_name         | string   | null: false                |
| last_name_reading  | string   | null: false                |
| first_name_reading | string   | null: false                |
| birthday           | date     | null: false                |

### Association
- has_many :items
- has_many :purchase
- has_many :comments


## itemsテーブル
| Column             | Type       | Options                         |
| --------           | --------   | --------                        |
| user_id            | references | null: false, foreign_key: true  |
| item_name          | string     | null: false                     |
| explanation        | text       | null: false                     |
| category           | integer    | null: false                     |
| condition          | integer    | null: false                     |
| delivery_cost      | integer    | null: false                     |
| delivery_place     | string     | null: false                     |
| days_delivery      | integer    | null: false                     |
| price              | integer    | null: false                     |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## purchaseテーブル
| Column             | Type      | Options                        |
| --------           | --------  | --------                       |
| user_id            | reference | null: false, foreign_key: true |
| item_id            | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column             | Type     | Options                    |
| --------           | -------- | --------                   |
| postal_code        | integer  | null: false                |
| municipal          | string   | null: false                |
| address            | string   | null: false                |
| building_name      | string   |                            |
| phone_number       | integer  | null: false                |

### Association
- belongs_to :purchase


## commentsテーブル  ##
| Column             | Type      | Options                        |
| --------           | --------  | --------                       |
| content            | text      | null: false                    |
| user_id            | reference | null: false, foreign_key: true |
| item_id            | reference | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item