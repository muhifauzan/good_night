# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless User.first
  user1 = User.create(name: 'User One')
  user2 = User.create(name: 'User Two')
  user3 = User.create(name: 'User Three')

  user1.sleeps.create(start_time: '20230101T210000', end_time: '20230102T050000')
  user1.sleeps.create(start_time: '20230102T220000', end_time: '20230103T050000')
  user1.sleeps.create(start_time: '20230103T230000', end_time: '20230104T070000')

  user2.sleeps.create(start_time: '20230101T230000', end_time: '20230102T080000')
  user2.sleeps.create(start_time: '20230103T010000', end_time: '20230103T100000')
  user2.sleeps.create(start_time: '20230104T000000', end_time: '20230104T110000')

  user3.sleeps.create(start_time: '20230101T220000', end_time: '20230102T060000')
  user3.sleeps.create(start_time: '20230102T220000', end_time: '20230103T070000')
  user3.sleeps.create(start_time: '20230103T210000', end_time: '20230104T060000')

  user1.followees << user2
  user1.followees << user3
end
