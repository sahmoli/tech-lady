class ImgsController < ApplicationController
  # GET /imgs
  # GET /imgs.json
  def index
    @imgs = Img.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imgs }
    end
  end

  # GET /imgs/1
  # GET /imgs/1.json
  def show
    @img = Img.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @img }
    end
  end

  # GET /imgs/new
  # GET /imgs/new.json
  def new
    @img = Img.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @img }
    end
  end

  # GET /imgs/1/edit
  def edit
    @img = Img.find(params[:id])
  end

  # POST /imgs
  # POST /imgs.json
  def create
    @img = Img.new(params[:img])

    respond_to do |format|
      if @img.save
        format.html { redirect_to @img, notice: 'Img was successfully created.' }
        format.json { render json: @img, status: :created, location: @img }
      else
        format.html { render action: "new" }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imgs/1
  # PUT /imgs/1.json
  def update
    @img = Img.find(params[:id])

    respond_to do |format|
      if @img.update_attributes(params[:img])
        format.html { redirect_to @img, notice: 'Img was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgs/1
  # DELETE /imgs/1.json
  def destroy
    @img = Img.find(params[:id])
    @img.destroy

    respond_to do |format|
      format.html { redirect_to imgs_url }
      format.json { head :no_content }
    end
  end
end
