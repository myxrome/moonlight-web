class ScenariosController < ApplicationController

  # GET /scenarios
  def index
    @scenarios = Scenario.where(active: true)&.all
    render json: @scenarios
  end

  def play
    @scenario = Scenario.where(active: true, key: params[:key])&.first
    if @scenario
      render json: @scenario, serializer: Play::ScenarioSerializer, include: '**'
    else
      head :ok
    end
  end

end
