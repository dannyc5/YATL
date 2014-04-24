class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    @problem.update_attributes!(problem_params)
    redirect_to root_path
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
