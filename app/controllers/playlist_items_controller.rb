class PlaylistItemsController < ApplicationController
  def index
    @playlist_items = @broadcast.playlist_items.all(:order=>'list_position DESC')
  end
  private
    def load_context
      @broadcast = Broadcast.find(:first)
    end
end
