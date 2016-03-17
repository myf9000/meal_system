class IdeasController < ApplicationController
  def index
    respond_with Idea.all
  end

  def create
    idea = Idea.create!(idea_params.merge(user: current_user))
    respond_with idea
  end

  def show
    idea = Idea.find(params[:id])
    respond_with idea
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :desc)
  end

end
