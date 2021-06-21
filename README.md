## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :memos


## memos テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| memo_title     | string     |                                |
| memo           | string     | null: false                    |
| frame_type_id  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user