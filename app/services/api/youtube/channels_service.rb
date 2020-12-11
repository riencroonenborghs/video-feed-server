module Api
  module Youtube
    class ChannelsService < ::Api::Youtube::ApiService
      def self.watched_videos
        search(part: "contentDetails", mine: true)
      end

      def self.search(options = {})
        obj = new
        obj.get "/channels", options
      end 
    end
  end
end