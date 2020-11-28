class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def correct_user
    event = Event.find(params[:id])
    if current_user != event.user
      redirect_to events_path
    end
  end

  def top
  end

  def index
    @events = Event.where("events.event_date >= ?", DateTime.now - 5)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id=current_user.id
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      redirect_to edit_event_path(@event.id)
    end
  end

  def destroy
    @event.destroy
    @user = current_user
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :event_name, :event_content, :event_date, :branch, :organizer, :secretary, :executive_director,
                                  :nearest_station, :place, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :is_active)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
