class Commit
  attr_reader :author_name, :commit_message, :commit_date, :sha
  def initialize(attrs = {})
    @sha = attrs[:sha]
    @author_name = attrs[:commit][:author][:name]
    @commit_message = attrs[:commit][:message]
    @commit_date = attrs[:commit][:author][:date]
  end

  def self.recent_commits(current_user)
    names = Repo.repo_names(current_user)
    repo_commits = Array.new
    names.each do |repo_name|
      hash = GithubService.new(current_user).get_recent_commits(repo_name)
      commits_for_repo = hash.map do |commit|
        Commit.new(commit)
      end
    repo_commits << {repo_name => commits_for_repo}
    end
  repo_commits
  end

end
