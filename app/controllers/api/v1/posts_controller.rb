class Api::V1::PostsController < ApplicationController

    respond_to :json

    def index
      respond_with Post.all
    end

    def show
      respond_with post
    end

    def update
      respond_with post.update(post_params)
    end

    private

    def post
      Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:state)
    end

end
