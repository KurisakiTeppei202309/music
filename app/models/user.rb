class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  validates :like_genre, presence: false 
  validates :like_artist, presence: false

   has_many :likes, dependent: :destroy
   has_many :liked_songs, through: :likes, source: :song
   
   has_many :messages, dependent: :destroy
   has_many :entries, dependent: :destroy
  
   has_many :rooms, dependent: :destroy
   
   def already_liked?(song)
    self.likes.exists?(song_id: song.id)
  end

  mount_uploader :image, ImageUploader
  
end
