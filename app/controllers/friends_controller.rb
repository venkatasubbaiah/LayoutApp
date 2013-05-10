class FriendsController < ApplicationController

  def index

    @friends = current_user.friends.paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def map
    @friends = current_user.friends.all
    @all_friend_details = []
    @friends.each do |friend|
       friend_details = {"name" => friend.name,"city" => friend.city,"laptitude" => friend.latitude, "longitude" => friend.longitude}
       @all_friend_details << friend_details

    end
  end
end
