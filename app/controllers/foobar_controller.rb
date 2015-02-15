class FoobarController < ApplicationController
  def home
  end
  def bootstrap_testing
    render params[:name]
  end
end
