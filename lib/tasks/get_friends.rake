namespace :facebook do
  desc 'get the friends from facebook'
  task :get_friends => :environment do
    User.all.each do |user|
      my_query ="SELECT name,uid, current_location.city FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me())"
      access_token = user.authentications.first['token']
      query_url = "https://api.facebook.com/method/fql.query?query=#{my_query}&format=json&access_token=#{access_token}"
      resp = Nokogiri.HTML(open(URI.escape(query_url)))
      @friends = ActiveSupport::JSON.decode(resp)
      @friends.each do |friend|

        user.friends.create(
            :name =>  friend['name'],
            :facebook_uid => friend['uid'],
            :city => (friend['current_location']['city'] rescue '')
        )
      end
    end


  end

end
