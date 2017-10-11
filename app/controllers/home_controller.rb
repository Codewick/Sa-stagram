class HomeController < ApplicationController
  def landing
    @brand = "Instagram"
    @photos = Photo.last(20)
  end
end
