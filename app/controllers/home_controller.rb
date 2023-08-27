class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(20)
  end
end
