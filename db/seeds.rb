# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com"
u.password = "111111"
u.password_confirmation = "111111"
u.is_admin = true
u.save

p = Product.new
p.title = "天天用英语"
p.expertname = "李笑来"
p.experttitle = "前新东方名师，终身学习者，天使投资人，比特币亿万富翁。"
p.description = "英语是拿来用的，只有使用才能精进"
p.price = 365
p.quantity = 10
p.save

p = Product.new
p.title = "超级行动力"
p.expertname = "吴明月"
p.experttitle = "国际品酒师、个体转型跨界专家"
p.description = "用一年，改变自己！"
p.price = 599
p.quantity = 10
p.save
