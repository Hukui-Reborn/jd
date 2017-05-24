# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies : Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  user_name: "admin",
  email: "admin@test.com",
  password: "111111",
  password_confirmation: "111111",
  is_admin: true,
)
puts "Admin 账号已建立"

Product.create!(
  title: "天天用英语",
  expertname: "李笑来",
  experttitle: "前新东方名师，终身学习者，天使投资人，比特币亿万富翁。",
  description: "英语是拿来用的，只有使用才能精进!",
  price: 365,
  quantity: 10,
  reply_time: 1,
  image: open("http://olt6cko37.bkt.clouddn.com/20170524149561848282012.jpg")
)
Product.create!(
  title: "超级行动力",
  expertname: "吴明月",
  experttitle: "国际品酒师、个体转型跨界专家",
  description: "用一年，改变自己！",
  price: 599,
  quantity: 10,
  reply_time: 1,
  image: open("http://olt6cko37.bkt.clouddn.com/20170524149561853037939.jpg")
)

#Product.new
#p.title : "认知学习法"
#p.expertname : "千古刘传"
#p.experttitle : "创业者，3年营销策划，脑洞文案，齐物论者"
#p.description : "从认知科学底层规律带你飞！"
#p.price : 599
#p.quantity : 10
#p.reply_time : 1
#p.save
