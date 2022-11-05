class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def daily
  end
  
  def my_sites
    @recycling_sites = RecyclingSite.where(collector: current_user)
  end
end
