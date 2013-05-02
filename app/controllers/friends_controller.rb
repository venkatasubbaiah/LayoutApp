class FriendsController < ApplicationController

  def index
    @friends = current_user.friends.limit(10)
  end
end
