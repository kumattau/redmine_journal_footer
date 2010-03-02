class JournalFooterListener < Redmine::Hook::ViewListener

  def view_layouts_base_html_head(context)
    stylesheet_link_tag(
      'journal_footer',
      :plugin => 'redmine_journal_footer'
    )
  end

  def view_issues_show_details_bottom(context)
    javascript_include_tag(
      'journal_footer',
      :plugin => 'redmine_journal_footer'
    )
  end

  render_on :view_issues_history_journal_bottom,
            :partial => 'journals/footer'

  def view_journals_update_rjs_bottom(context)
    fix_if_journal_is_nothing(context)
  end

  def fix_if_journal_is_nothing(context)
    if context[:journal].issue.journals.size == 0
      context[:page].remove "history"
    end
    return ""
  end
end
