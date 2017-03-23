class Repo
  attr_reader :html_url, :name, :language, :updated_at
  def initialize(attrs = {})
    @html_url   = attrs[:html_url]
    @name       = attrs[:name]
    @language   = attrs[:language]
    @updated_at = attrs[:updated_at]
  end

  def self.repos(current_user)
    GithubService.new(current_user).get_repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
