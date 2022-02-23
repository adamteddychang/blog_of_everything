# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Adam', photo: 'https://genericphoto.com/user1', bio: 'Software developer from Taiwan')

post1 = Post.create(user: first_user, title: 'Post 1 title', text: 'This is the first post of first user')
post2 = Post.create(user: second_user, title: 'Post 2 title', text: 'This is the first post of second user')
post3 = Post.create(user: first_user, title: 'Post 3 title', text: 'This is the second post of first user')
post4 = Post.create(user: third_user, title: 'Post 4 title', text: 'This is the first post of Third user')

comment1 = Comment.create(text: 'Comment 1', user: first_user, post: post1)
comment2 = Comment.create(text: 'Comment2', user: second_user, post: post2)
comment3 = Comment.create(text: 'Comment3', user: third_user, post: post3)
comment4 = Comment.create(text: 'Comment4', user: first_user, post: post3)
comment5 = Comment.create(text: 'Comment5', user: second_user, post: post1)
comment6 = Comment.create(text: 'Comment6', user: third_user, post: post2)
