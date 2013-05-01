class FriendsController < ApplicationController
  def show
  end
  def get_my_friends
    #@facebook_user = FbGraph::User.me(current_user.authentications.first['token']).friends
    my_query ="SELECT name,uid FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me())"
    access_token = current_user.authentications.first['token']
    query_url = "https://api.facebook.com/method/fql.query?query=#{my_query}&format=json&access_token=#{access_token}"
    resp = Nokogiri.HTML(open(URI.escape(query_url)))
    @friends = ActiveSupport::JSON.decode(resp)

  end
end
