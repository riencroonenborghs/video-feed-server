require "httparty"

module Api
  class BaseApiService
    include Loggable

    def post(path, body, query = {})
      options = {
        body: body,
        headers: headers
      }
      log_debug "ApiService#post -- url: #{url(path, query)}"
      log_debug options
      response = HTTParty.post url(path, query), options
      log_debug "ApiService#post -- response"
      log_debug response.body
      JSON.parse response.body
    end

    def post_upload(path, file_data, query = {})
      options = {
        body: {upload: file_data},
        headers: headers
      }
      log_debug "ApiService#post -- url: #{url(path, query)}"
      log_debug options
      response = HTTParty.post url(path, query), options
      log_debug "ApiService#post -- response"
      log_debug response.body
      JSON.parse response.body
    end

    def get(path, query = {})
      log_debug "ApiService#get -- url: #{url(path, query)}"
      response = HTTParty.get url(path, query), headers: headers
      log_debug "ApiService#get -- response"
      log_debug response.body
      JSON.parse response.body
    end

    def delete(path, query = {})
      log_debug "ApiService#delete -- url: #{url(path, query)}"
      response = HTTParty.delete url(path, query), headers: headers
      log_debug "ApiService#delete -- response"
      log_debug response.body
      JSON.parse response.body
    end

    def put(path, body, query = {})
      options = {
        body: body,
        headers: headers
      }

      log_debug "ApiService#put -- url: #{url(path, query)}"
      response = HTTParty.put url(path, query), options
      log_debug "ApiService#put -- response"
      log_debug response.body
      JSON.parse response.body
    end

    private

    def base_url
      raise "implement me"
    end

    def url(path, query = {})
      query = build_query query      
      query.blank? ? "#{base_url}#{path}" : "#{base_url}#{path}?#{query}"      
    end

    def headers
      {}
    end

    def build_query(query = {})
      query_data  = []
      query.each do |key, value|
        if value.is_a? Array
          query_data << "#{key}=#{value.join(',')}"
        else
          query_data << "#{key}=#{value}"
        end
      end
      query_data.join('&')
    end
  end
end
