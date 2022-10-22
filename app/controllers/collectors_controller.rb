class CollectorsController < ApplicationController
  def index
    @collectors = User.where(collector: true)
  end
end
