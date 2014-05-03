class User
  attr_reader :username
  include HTTParty
  base_uri 'https://api.github.com'
  
  def initialize(username)
    @username = username
    @repos = []
  end

  def repos
    response = self.class.get("/users/#{username}/repos", headers: { 'User-Agent' => 'github api codetest' } )
    response.each { |repo| @repos << repo }
    @repos
  end

end