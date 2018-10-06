module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
   link_to author, repo
  end
end
