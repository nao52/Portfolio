class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  before_save :downcase_email

  has_many :contents
  has_many :microposts, dependent: :destroy
  has_many :active_relationships,  class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :subscription_channels, dependent: :destroy
  has_many :channels, through: :subscription_channels, source: :channel
  has_many :popular_videos, dependent: :destroy
  has_many :videos, through: :popular_videos, source: :video
  has_many :best_videos, dependent: :destroy
  has_many :favorite_videos, through: :best_videos, source: :video
  has_many :best_channels, dependent: :destroy
  has_many :favorite_channels, through: :best_channels, source: :channel

  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :age, allow_nil: true, numericality: { only_integer: true, in: 13..100 }
  validates :gender, presence: true
  validates :profile, length: { maximum: 400 }
  validates :reset_password_token, uniqueness: true, allow_nil: true
  validates :remember_me_token, uniqueness: true, allow_nil: true

  # 性別 { 回答なし: 0, 男性: 1, 女性: 2, その他: 9 }
  enum gender: { not_known: 0, male: 1, female: 2, not_applicabel: 9 }

  def subscription_channels_with_public
    subscription_channel_ids = subscription_channels.where(is_public: true).ids
    channels.where(id: subscription_channel_ids)
  end

  def popular_videos_with_public
    popular_video_ids = popular_videos.where(is_public: true).ids
    videos.where(id: popular_video_ids)
  end

  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def update_subscriptions(subscription_channels)
    channels.delete_all if channels.present?
    subscription_channels.each do |channel|
      add_subscription(channel)
    end
  end

  def add_subscription(channel)
    channels << channel unless channels.include?(channel)
  end

  def update_popular_videos(popular_videos)
    videos.delete_all if videos.present?
    popular_videos.each do |video|
      add_popular_videos(video)
    end
  end

  def add_popular_videos(video)
    videos << video unless videos.include?(video)
  end

  def update_favorite_channels(channels)
    return false unless channels.count == 3

    best_channels.delete_all if favorite_channels.present?
    channels.each_with_index do |channel, index|
      best_channels.create(channel:, rank: index + 1)
    end
  end

  def update_favorite_videos(videos)
    return false unless videos.count == 3

    best_videos.delete_all if favorite_videos.present?
    videos.each_with_index do |video, index|
      best_videos.create(video:, rank: index + 1)
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
