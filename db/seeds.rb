# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!([
    { name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.', posts_counter: 1},
    { name: 'Jafari', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something else.', posts_counter: 2 }
  ])

Post.create!([
    { author_id: 1, title: 'Hello', text: 'This is my first post', comments_counter: 1, likes_counter: 1 },
    { author_id: 2, title: 'Hello2', text: 'This is my 2nd post', comments_counter: 2, likes_counter: 2 },
    { author_id: 1, title: 'Hello3', text: 'This is my 3rd post', comments_counter: 3, likes_counter: 3 },
    { author_id: 2, title: 'Hello4', text: 'This is my 4th post', comments_counter: 4, likes_counter: 2 }
  ])

Comment.create!([
       { post_id: 1, author_id: 1, text: 'comment 1' },
       { post_id: 1, author_id: 2, text: 'comment 2' },
       { post_id: 1, author_id: 1, text: 'comment 3' },
       { post_id: 1, author_id: 2, text: 'comment 4' },
       { post_id: 1, author_id: 1, text: 'comment 5' },
       { post_id: 1, author_id: 1, text: 'comment 6' }
     ])
