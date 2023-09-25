class Song < ApplicationRecord
    belongs_to :user

    has_many :song_tags, dependent: :destroy
    has_many :tags, through: :song_tags
    
    has_many :song_genres, dependent: :destroy
    has_many :genres, through: :song_genres

    has_many :song_situations, dependent: :destroy
    has_many :situations, through: :song_situations

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    
    mount_uploader :image, ImageUploader
    
end
