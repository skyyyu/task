# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#   rake db:seedでテストユーザが作成される

user = User.new(email: "example@co.jp", username: "example", password: "123456")
user.skip_confirmation!
user.save

puts "exampleユーザーが作成されました"