module Api
  module Youtube
    class ApiService < ::Api::BaseApiService

      def get(path, query = {})
        query.update(key: ENV["YOUTUBE_API_KEY"])
        super
      end

      private

      def base_url
        "https://www.googleapis.com/youtube/v3"
      end
    end
  end
end
