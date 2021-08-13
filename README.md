
# meMoru
# 概要
自分で書き込んだメモの背景を選ぶことができるアプリケーションです。
# 本番環境
https://memoru-iheuko.herokuapp.com/
ログイン情報（テスト用）
・Eメール：bbb@gmail.com
・パスワード：00000a
# 制作背景
自分で書いたメモに何か装飾を加えられたら面白そうだと思い、制作しました。
# DEMO
### 自分でメモの背景を選べる機能
https://gyazo.com/312e133a3ebc01e1a34bd4b18a549cb6
### 選ばずに書き込むことも可能です
https://gyazo.com/b0adf3376fef198b52b10ddf55b2b1dd
# 工夫したポイント
ログインしたユーザーのトップページに、そのユーザーの書き込んだメモを表示できるようにしたところです。
https://gyazo.com/0cba1a36247213fedf609ea5c54298a6
# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code
# 課題
現在、背景画像の切り替え処理をif文だけで成り立てており、選択できる画像が増えるほど、同じ処理を記述することになるため、このif文での処理をまとめるべきだと考えています。
# DB設計

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