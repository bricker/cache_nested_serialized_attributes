To reproduce:

```ruby
bundle install
rake db:setup
rails c


1.9.3-p392 :009 > users = User.all
  User Load (0.4ms)  SELECT "users".* FROM "users" 
 => [#<User id: 1, name: "bricker", created_at: "2013-04-24 06:26:03", updated_at: "2013-04-24 06:26:03">, #<User id: 2, name: "other", created_at: "2013-04-24 06:26:03", updated_at: "2013-04-24 06:26:03">] 


1.9.3-p392 :010 > users.first.posts.first
  Post Load (0.5ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 1 LIMIT 1
 => #<Post id: 1, title: "Test Post", metadata: {:url=>"http://posts.com/1-test-post", :status=>"Published"}, user_id: 1, created_at: "2013-04-24 06:26:03", updated_at: "2013-04-24 06:26:03"> 


1.9.3-p392 :011 > users.last.posts.first
  Post Load (1.6ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 2 LIMIT 1
 => #<Post id: 2, title: "Test Post 2", metadata: {:url=>"http://posts.com/2-test-post", :status=>"Published"}, user_id: 2, created_at: "2013-04-24 06:26:03", updated_at: "2013-04-24 06:26:03"> 


1.9.3-p392 :012 > dump = Marshal.dump(users)
  Post Load (0.4ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 1
  Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 2
 => (marshal dump string)


1.9.3-p392 :013 > Marshal.load(dump)
 => [#<User id: 1, name: "bricker", created_at: "2013-04-24 06:26:03", updated_at: "2013-04-24 06:26:03">, :@new_record] 
```
