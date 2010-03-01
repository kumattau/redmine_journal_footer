module ApplicationHelper
  def link_to_time(time)
    text = format_time(time)
    if @project
      link_to(text, {
        :controller => "projects",
        :action     => "activity",
        :id         => @project,
        :from       => time.to_date
      })
    else
      text
    end
  end
end
