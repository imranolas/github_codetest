class User
  attr_reader :username, :reader
  include HTTParty
  base_uri 'https://api.github.com'
  
  def initialize(username)
    @username = username
  end

  def repos
    unless @repos
      response = self.class.get("/users/#{username}/repos", headers: { 'User-Agent' => 'github api codetest' } )
      @repos = []
      begin
        @message = response["message"]
      rescue TypeError
        response.each { |repo| @repos << repo }
      end
    end
    @repos
  end

  def languages
    if @message
      {}
    else
      languages = repos.map { |repo| repo.fetch('language', nil) }
      languages.inject(Hash.new(0)) { |hash,v| hash[v] += 1; hash }
    end
  end

  def favourite_language
    repos.empty? ? @message : languages.max_by { |k,v| v }.first
  end

end