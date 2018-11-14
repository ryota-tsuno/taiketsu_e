json.array! @array do |taiketsu|
  json.id taiketsu.id
  json.first_topic taiketsu.topics.first.topic
  json.second_topic taiketsu.topics.second.topic
  json.left_count taiketsu.topics.first.comments.count
  json.right_count taiketsu.topics.second.comments.count
end
