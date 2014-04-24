class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
  end

  def create
    Problem.create!(problem_params)
    redirect_to root_path
  end

  def destroy
    problem = Problem.find(params[:id])
    problem.destroy!
    redirect_to root_path
  end
  private

  def problem_params
    params.require(:problem).permit(:message)
  end
end
