class JqueryController < ApplicationController
  def index
    render params[:name]
  end
end
