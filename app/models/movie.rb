class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews,dependent: :destroy
  has_many :comments,dependent: :destroy
  belongs_to :genre
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  def self.search(keyword)
     where('filmname LIKE ? OR introduction LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      # old.delete Tag.find_by(tag_name: old)
      self.tags.where(tag_name: old).destroy_all
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_movie_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_movie_tag
   end
  end

end
