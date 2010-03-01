class JournalsController < ApplicationController
  unloadable

  def update
    if request.post?
      @journal.update_attributes(
        :user => User.find(params[:journal][:user_id]))
      @journal.update_attributes(
        :created_on => DateTime.strptime(
          params[:journal][:created_on], "%Y-%m-%d %H:%M"))
      respond_to do |format|
        format.html {
          redirect_to({
            :controller => 'issues',
            :action     => 'show',
            :id         => @journal.journalized_id
          })
        }
      end
    end
  end

  def delete
    if request.post?
      @journal.destroy
      respond_to do |format|
        format.html {
          redirect_to({
            :controller => 'issues',
            :action     => 'show',
            :id         => @journal.journalized_id
          })
        }
      end
    end
  end
end
