class HomeController < ApplicationController
  layout 'index_page'

  def index
    @imgs = Img.all
    @activity = Activity.order("activity_date  DESC").first
  end
end
