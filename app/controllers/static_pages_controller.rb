class StaticPagesController < ApplicationController
  def home
    @featured_products = RealEstate.limit(8).order("RANDOM()")
  end
  
  def help
  end

  def about
  end

  def contact
  end
end