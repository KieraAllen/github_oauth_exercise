class DashboardController < ApplicationController
  def show
    repo_service = RepoService.new(current_user)
    @private_repos = repo_service.private_repos
    @public_repos = repo_service.public_repos
  end
end
