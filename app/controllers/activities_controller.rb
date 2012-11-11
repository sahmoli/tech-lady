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
  #
  ## PUT /articles/1
  ## PUT /articles/1.json
  #def update
  #  @article = Article.find(params[:id])
  #
  #  respond_to do |format|
  #    if @article.update_attributes(params[:article])
  #      format.html { redirect_to @article, notice: 'Article was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @article.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
end
