class Api::V1::PostsController < ApplicationController

    respond_to :json

    def show
      if p = post
        respond_with p
      else
        respond_with Post.all
      end
    end

    private

    def post
      Post.find_by_id(params[:id])
    end

end
