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

  def petition_my_site
    @my_petitions = Petition.where(recycling_site: current_user)
  end
end
