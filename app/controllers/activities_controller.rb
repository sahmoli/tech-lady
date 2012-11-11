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

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

      if @activity.update_attributes(params[:activity])
        redirect_to @activity, notice: 'Activity was successfully updated.'
      else
        render action: "edit"
      end
  end
end
