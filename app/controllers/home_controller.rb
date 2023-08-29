class HomeController < ApplicationController
  def index
    @products = Products::SearchService.new(params[:keyword], params[:page] || 0, params[:per] || 12).call
  end
end
