module JournalsHelper
  def render_user_string
    link_to_user(@journal.user)
  end

  def render_time_string
    link_to_time(@journal.created_on)
  end

  def render_journal_form(&block)
    form_tag(
      {
        :controller => 'journals',
        :action     => 'update',
        :id         => @journal
      },
      :style => 'display: none;',
      :id    => "journal-#{@journal.id}-editor",
      &block
    )
  end

  def render_user_select
    select(
      'journal',
      'user_id',
      User.all.collect{|user|
        [h(user.name), user.id]
      }
    )
  end

  def render_time_select
    html = []
    jid = "journal-#{@journal.id}"
    html << text_field(
      'journal',
      'created_on',
      :value => @journal.created_on.strftime('%Y-%m-%d %H:%M'),
      :style => 'width: 120px;',
      :id    => jid + '-picker'
    )
    html << javascript_tag("render_calendar('#{jid}')")
    html.join("\n");
  end

  def render_journal_update
    jid = "journal-#{@journal.id}"
    link_to(
      l(:button_edit),
      '#',
      :class   => 'icon icon-edit',
      :onclick => "return update_journal('#{jid}', '#{l(:invalid_date)}')",
      :id      => jid + '-update'
    )
  end

  def render_journal_delete
    jid = "journal-#{@journal.id}"
    link_to(
      l(:button_delete),
      {
        :controller => 'journals',
        :action     => 'delete',
        :id         => @journal
      },
      :method => :post,
      :confirm => l(:text_are_you_sure),
      :class => 'icon icon-del',
      :id      => jid + '-delete'
    )
  end

  def render_journal_toggle(text)
    jid = "journal-#{@journal.id}"
    link_to(
      text, '#',
      :onclick => "return toggle_journal_footer('#{jid}')"
    )
  end
end
