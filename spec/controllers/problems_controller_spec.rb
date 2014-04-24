require 'spec_helper'

describe ProblemsController do

  let!(:problem) { create(:problem) }

  describe 'POST #edit' do
    it 'assigns the requested problem to @problem' do
      get :edit, id: problem.id
      expect(assigns(:problem)).to eq problem
    end

    it 'renders the :edit template' do
      get :edit, id: problem.id
      expect(response).to render_template :edit
    end
  end

  describe 'POST #update' do
    it 'located the requested problem' do
      patch :update, id: problem.id, problem: attributes_for(:problem)
      expect(assigns(:problem)).to eq problem
    end

    it 'changes problem attributes' do
      patch :update, id: problem.id, problem: attributes_for(:problem, message: "hello")
      problem.reload
      expect(problem.message).to eq "hello"
    end

    it 'redirect to root_path' do
      patch :update, id: problem.id, problem: attributes_for(:problem)
      expect(response).to redirect_to root_path
    end
  end

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
      expect{post :destroy, id: problem.id}.to change(Problem.all, :count).by -1
    end

    it 'redirect to root_path' do
      post :create, problem: attributes_for(:problem)
      expect(response).to redirect_to root_path
    end
  end
end
