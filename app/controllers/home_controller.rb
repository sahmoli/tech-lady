class HomeController < ApplicationController
  layout 'index_page'

  def index
    @imgs = Img.all
  end
end
