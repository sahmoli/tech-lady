class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find_by_id(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      redirect_to @activity
    else
      redirect_to :action => "new"
    end
  end

  def index
    @activities = Activity.all

  end
end
