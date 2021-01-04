class RepoService
  def initialize(user)
    @user = user
  end

  def private_repos
    repos.find_all do |repo|
      repo[:private] == true
    end
  end

  def public_repos
    repos.find_all do |repo|
      repo[:private] == false
    end
  end

  private
  attr_reader :user

  def repos
    response = Faraday.get("https://api.github.com/user/repos", {}, {"Authorization": "token #{user.token}" })

    JSON.parse(response.body, symbolize_names: true)
  end
end
