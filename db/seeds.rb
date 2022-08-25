# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!([
    { name: 'Hadi', photo: 'https://images.pexels.com/photos/1382731/pexels-photo-1382741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', posts_counter: 0, email: 'ali@example.com', password: '$2a$12$70A5cldEkqtbJLevm1VLOOJa8BnILnuZ5jS49WUdrsfwR/WQ2Am0q'},
    { name: 'Jafari', photo: 'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales.Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..', posts_counter: 0,email: 'jafari@example.com', password: '$2a$12$70A5cldEkqtbJLevm1VLOOJa8BnILnuZ5jS49WUdrsfw'},
    { name: 'John', photo: 'https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..', posts_counter: 0, email: 'john@example.com', password: '$2a$12$70A5cldEkqtbJLevm1VLOOJa8BnILnuZ5jS49WUdrsfwR/WQ2Am0c' }
  ])

Post.create!([
    { author_id: 1, title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales.', comments_counter: 0, likes_counter: 0 },
    { author_id: 2, title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales.', comments_counter: 0, likes_counter: 0 },
    { author_id: 1, title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales.', comments_counter: 0, likes_counter: 0 },
    { author_id: 2, title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales.', comments_counter: 0, likes_counter: 0 }
  ])

Comment.create!([
       { post_id: 1, author_id: 1, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 1' },
       { post_id: 1, author_id: 2, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 2' },
       { post_id: 1, author_id: 1, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 3' },
       { post_id: 1, author_id: 2, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 4' },
       { post_id: 1, author_id: 1, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 5' },
       { post_id: 1, author_id: 1, text: 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. 6' }
     ])