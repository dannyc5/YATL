require 'spec_helper'

describe ProblemsController do

  # ARRANGE: let! runs block statement before every test. Use let/let! for arrange.
  let!(:problem) { create(:problem) }

  describe 'POST #edit' do
    # ACT: use before :each blocks to act.
    before :each do
      get :edit, id: problem.id
    end

    it 'assigns the requested problem to @problem' do
      # note: assigns here checks if @problem was assigned; non-instance vars in controller won't work.
      expect(assigns(:problem)).to eq problem
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #update' do
    before :each do
      patch :update, id: problem.id, problem: attributes_for(:problem, message: "hello")
    end

    it 'located the requested problem' do
      expect(assigns(:problem)).to eq problem
    end

    it 'changes problem attributes' do
      problem.reload
      expect(problem.message).to eq "hello"
    end

    it 'redirect to root_path' do
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
