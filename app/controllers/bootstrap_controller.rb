class BootstrapController < ApplicationController
  def index
    render params[:name]
  end
end
