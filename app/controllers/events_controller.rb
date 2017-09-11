class EventsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def index
    @events = Event.paginate(page: params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end


  private

    def event_params
      params.require(:event).permit(:title)
    end
end
