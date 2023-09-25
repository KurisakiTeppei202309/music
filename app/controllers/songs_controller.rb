class SongsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def top 
    end

    def index
        

          if params[:search] == nil
            @Songs = params[:tag_id].present? ? Tag.find(params[:tag_id]).songs : Song.all
          elsif params[:search] == ''
            @Songs = params[:tag_id].present? ? Tag.find(params[:tag_id]).songs : Song.all
          else
      
          @Songs = Song.where("storename LIKE ? OR menu LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
          end

    
    end
    
    def new
        @Song=Song.new
    end

    
    def create
        song = Song.new(song_params)

        song.user_id = current_user.id 

        if song.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @song = Song.find(params[:id])
    end
     
    def update
        song = Song.find(params[:id])
        if song.update(song_params)
          redirect_to :action => "show", :id => song.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
      song = Song.find(params[:id])
      song.destroy
      redirect_to action: :index
    end
    

        private
    
            def song_params
            params.require(:song).permit(:name, :artist, :genre_ids, :tag_ids, :situation_ids, :url, :image,:like_genre,:like_artist)
            end
end
