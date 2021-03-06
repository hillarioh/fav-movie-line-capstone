class LinesController < ApplicationController
  before_action :authenticate_user, only: %i[new index create]
  def new
    @line = Line.new
  end

  def index
    @lines = Line.ordered_by_most_recent
    @users = User.all
  end

  def create
    @line = current_user.lines.build(line_params)
    if @line.save
      flash[:success] = 'Line successfully created'
      redirect_to lines_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def line_params
    params.require(:line).permit(:text, :author_id, :movie_title)
  end
end
