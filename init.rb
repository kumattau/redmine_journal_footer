require 'redmine'
require 'journal_footer_listener'

Redmine::Plugin.register :redmine_journal_footer do
  name 'Redmine Journal Footer plugin'
  author 'kumattau'
  description 'This is a journal footer plugin for Redmine'
  version '0.0.2'

  project_module :issue_tracking do |map|
    permission(
      :admin_journals,
      {:journals => [:delete, :update]},
      :require => :loggedin
    )
  end
end
