class ScenariosController < ApplicationController

  # GET /scenarios
  def index
    @scenarios = Scenario.where(active: true).all
    render json: @scenarios
  end

end
