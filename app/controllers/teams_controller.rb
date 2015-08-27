class TeamsController < ApplicationController

  def index
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    Team.add_columns_for_tenant(@tenant,params[:names])
    Team.reset_column_information
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    render action: :index
  end

  private

  def team_params
    result = params.require(:team)
    if params[:names] && params[:values]
      params[:names].each_index { |i|
        result[ params[:names][i].to_sym ] = params[:values][i]
      }
    end
    result.permit!
  end

end
