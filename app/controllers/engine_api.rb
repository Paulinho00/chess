# frozen_string_literal: true

class EngineApi
  include HTTParty
  base_uri 'https://lichess.org'

  def initialize(token)
    @token = token
  end

  def analyze_position(fen)
    require "uri"
    require "net/http"

    url = URI("https://lichess.org/api/cloud-eval" + "?fen=" + fen)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer " + @token

    response = https.request(request)


    if response.kind_of? Net::HTTPSuccess
      return response.body
    else
      return nil
    end
  end

  private

end