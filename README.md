# README

## taiketsusテーブル

|Column|Type|Options|
|------|----|-------|


### Association
- has_many :topics

## topicsテーブル

|Column|Type|Options|
|------|----|-------|
|topic|string|null: false|
|taiketsu_id|string|null: false|

### Association
- belongs_to :taiketsu
- has_many   :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|topic_id|integer|null: false, foreign_key: true|
|good_count|integer||
|bad_count|integer||

### Association
- belongs_to :topic
