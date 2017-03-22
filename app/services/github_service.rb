class GithubService
  attr_reader :conn
  def initialize
    @conn = Faraday.get("https://api.github.com/user?#{@token}")
  end

  def find(criteria)
    binding.pry
    parse(conn.get('login', criteria))
  end

  private

  def parse(response)
    # binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
