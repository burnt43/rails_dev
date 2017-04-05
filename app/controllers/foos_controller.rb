class FoosController < ApplicationController
  def index
    sleep 1
    @random_number = Random.rand(1000000)
  end

  def new
    @foo = Foo.new
  end

  def create
    @foo = Foo.new
    if @foo.update_attributes(foo_params)
      flash[:notice] = {success: "#{Foo.model_name.human} has been created."}
      redirect_to edit_foo_path(@foo)
    else
      flash[:notice] = {error: "#{Foo.model_name.human} could not be created."}
      render :new
    end
  end

  def edit
    @foo = Foo.find(params[:id])
  end

  def update
    @foo = Foo.find(params[:id])
    if @foo.update_attributes(foo_params)
      flash[:notice] = {success: "#{Foo.model_name.human} has been updated."}
      redirect_to edit_foo_path(@foo)
    else
      flash[:notice] = {error: "#{Foo.model_name.human} could not be updated."}
      render :edit
    end
  end

  def turbolinks_update
    @foo = Foo.find(params[:id])
    if @foo.update_attributes(foo_params)
      flash[:notice] = {success: "#{Foo.model_name.human} has been updated."}
      render js: "Turbolinks.visit('#{edit_foo_path(@foo)}')"
    else
      flash[:notice] = {error: "#{Foo.model_name.human} could not be updated."}
      render partial: 'form', status: 422
    end
  end

  private

  def foo_params
    params.require(:foo).permit(:name, :title, :strength, :agility, :intelligence)
  end
end
