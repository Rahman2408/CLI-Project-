require_relative '../config/environment'



class API
  @@api_key = "fdff312267msh8e7d79a718d7a7fp1027f1jsn5b63bcb0b23c"
  @@url = "https://montanaflynn-mapit.p.rapidapi.com/directions?ending=#{end_point}&starting=#{start_point}"
start_point = UI.start_point
end_point = UI.end_point

  def self.request_api
    uri = URI.parse(@@url)
    request = Net::HTTP.get_response(uri)
    
  end

