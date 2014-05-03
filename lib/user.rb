class User
  attr_reader :username, :reader
  include HTTParty
  base_uri 'https://api.github.com'
  
  def initialize(username)
    @username = username
  end

  def repos
    unless @repos
      begin
        response = self.class.get("/users/#{username}/repos", headers: { 'User-Agent' => 'github api codetest' } )
      rescue
        response = []
      end
      @repos = []
      begin
        @message = response["message"]
      rescue TypeError
        @repos = response
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