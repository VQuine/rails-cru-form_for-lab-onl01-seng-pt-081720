class ArtistsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
        set_artist
    end

    def update
        set_artist
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def show
        set_artist
    end

        private
        def set_artist
            @artist = Artist.find(params[:id])
        end

        def artist_params(*args)
            params.require(:artist).permit(*args)
        end
end
