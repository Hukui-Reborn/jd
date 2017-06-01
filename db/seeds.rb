# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies : Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  user_name: "胡奎",
  email: "admin@test.com",
  password: "111111",
  password_confirmation: "111111",
  is_admin: true,
  selfie: open("http://olt6cko37.bkt.clouddn.com/20170601149628544583525.png")
)
puts "Admin 账号已建立"

Article.create!(
  title: "Rails部署指南（小白篇）",
  description: "Rails 部署指南手把手教学篇",
  user_id: 1,
  image: open("http://olt6cko37.bkt.clouddn.com/20170601149628690425364.png")
)
puts "文章1已建立"

Article.create!(
  title: "Html基础教学",
  description: "Html最核心的几个概念手把手教学篇",
  user_id: 1,
  image: open("http://olt6cko37.bkt.clouddn.com/20170601149628697578512.png")
)
puts "文章2已建立"


Article.create!(
  title: "CSS Boxing模型详解",
  description: "五分钟带你学会CSS最核心的框模型",
  user_id: 1,
  image: open("http://olt6cko37.bkt.clouddn.com/20170601149628737589675.png")
)
puts "文章3已建立"
