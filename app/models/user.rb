class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_name, presence: {message:"请填入名称"}
  validates_uniqueness_of :user_name

  has_many :messages

  #挂上selfie的uploader,用作用户上传头像
  mount_uploader :selfie, SelfieUploader

  has_many :orders
  has_many :article #一个user有多篇文章

  has_many :relationships #建立user和product之间的多对多关系
  has_many :collections, through: :relationships, source: :product #user可以它找到收藏的物品

  has_many :goods_likes #建立user和喜欢的goods_likes之间的关系
  has_many :like_goods, through: :goods_likes, source: :product #user可以找到他喜欢的商品

  has_many :goods_dislikes #建立user和喜欢的goods_dislikes之间的关系
  has_many :dislike_goods, through: :goods_dislikes, source: :product

  has_many :comments #建立user和comment之间的对应关系

  has_many :products #建立user和product之间的对应关系

  has_many :user_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :user_relationships, source: :followed
  has_many :reverse_user_relationships, foreign_key: "followed_id",
    class_name: "UserRelationship",
    dependent: :destroy
  has_many :followers, through: :reverse_user_relationships,source: :follower

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def has_follower?(user)
    followed_users.include?(user)
  end

  def is_followed?
    follower.all
  end

  def follow!(user)
    followed_users << user
  end

  def unfollow!(user)
    followed_users.delete(user)
  end

  def admin?
    is_admin
  end

  #判断选中的product是否已经在收藏列表中
  def is_collector_of?(product)
    collections.include?(product)
  end

  #将选中的product加入收藏列表中
  def collect!(product)
    collections << product
  end

  #将选中的product从收藏列表中删除
  def  remove!(product)
    collections.delete(product)
  end

  #判断选择的product是不是在点赞列表中
  def is_voter_of?(product)
    like_goods.include?(product)
  end

  #将选中的product加入到点赞列表中
  def like!(product)
    like_goods << product
  end

  #判断选择的product是不是在被踩列表中
  def is_anti_of?(product)
    dislike_goods.include?(product)
  end

  #将选中的product加入到被踩列表中
  def dislike!(product)
    dislike_goods << product
  end

end
