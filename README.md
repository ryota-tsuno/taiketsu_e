# README

## taiketsusテーブル

|Column|Type|Options|
|------|----|-------|
|session_id|string||

### Association
- has_many :topics

## topicsテーブル

|Column|Type|Options|
|------|----|-------|
|topic|string|null: false|
|taiketsu_id|integer|null: false|

### Association
- belongs_to :taiketsu
- has_many   :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|topic_id|integer|null: false, foreign_key: true|
|session_id|string||

### Association
- belongs_to :topic
