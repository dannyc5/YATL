require 'spec_helper'

describe ProblemsController do

  describe 'POST #create' do
    it 'saves the new problem in the database' do
      expect{
        post :create, problem: attributes_for(:problem)
      }.to change(Problem.all, :count).by 1
    end

    it 'redirects to root_path' do
      post :create, problem: attributes_for(:problem)
      expect(response).to redirect_to root_path
    end
  end

  describe 'POST #delete' do
    it 'deletes the object from the database' do
      problem = create(:problem)
      expect{post :destroy, id: problem.id}.to change(Problem.all, :count).by -1
    end

    it 'redirect to root_path' do
      post :create, problem: attributes_for(:problem)
      expect(response).to redirect_to root_path
    end
  end
end
