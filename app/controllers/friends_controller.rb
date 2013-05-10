class FriendsController < ApplicationController

  def index

    @friends = current_user.friends.paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def map

  end
end
