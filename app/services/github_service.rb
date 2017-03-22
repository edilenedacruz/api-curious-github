class GithubService
  attr_reader :auth, :username, :access_token, :connect
  def initialize
    # @access_token = 'de3dbb79dc7163aee94953f025b0bd3582130d61'
    @username = 'edilenedacruz'
    @access_token = "de3dbb79dc7163aee94953f025b0bd3582130d61"
    @connect = Faraday.get("https://api.github.com/?access_token=de3dbb79dc7163aee94953f025b0bd3582130d61")
    # @auth = "?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
    # response = connection.get '/users'
  end

  def starred
    parse(connect.get "users/#{username}/starred" )
    binding.pry
  end

  # def connect
  #   Faraday.new(:url => 'https://api.github.com') do |faraday|
  #     faraday.adapter  Faraday.default_adapter
  #     faraday.params[:access_token] = @access_token
  #   end
  # end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
