class Situation < ApplicationRecord
    has_many :song_situations, dependent: :destroy
    has_many :songs, through: :song_situations
end
