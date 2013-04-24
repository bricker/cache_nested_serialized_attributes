# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create({
  :name => "bricker"
})

user2 = User.create({
  :name => "other"
})

Post.create([
  {
    :title    => "Test Post",
    :user_id  => user1.id,
    :metadata => {
      :url    => "http://posts.com/1-test-post",
      :status => "Published"
    }
  },
  {
    :title    => "Test Post 2",
    :user_id  => user2.id,
    :metadata => {
      :url    => "http://posts.com/2-test-post",
      :status => "Published"
    }
  }
])
