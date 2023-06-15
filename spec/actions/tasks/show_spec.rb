# frozen_string_literal: true

RSpec.describe HanamiTodoManager::Actions::Tasks::Show, type: [:request, :database] do
  let(:tasks) { app["persistence.rom"].relations[:tasks] } 
  let(:task) { tasks.insert(title: "Hello World")} # table.insert returns only the id

 describe 'GET tasks/:id' do

  context 'when task exist' do
    before do
      get "/tasks/#{task}"
    end

    it 'returns a 200 status' do
      expect(last_response).to be_successful
      expect(last_response.status).to eq(200)
    end
    
    it "returns one Task" do
      task_response = JSON.parse(last_response.body)
  
      expect(task_response['id']).to eq(task)
      expect(task_response['title']).to eq("Hello World")
    end
  end

  context "when task doesn't exist" do
    before do
      get "/tasks/0"
    end

    it "returns a 404" do
      expect(last_response.status).to eq(404)
    end

    it 'returns an error message' do
      response_content = JSON.parse(last_response.body)

      expect(response_content['error']).to eq("Cannot find task with id 0")
    end
  end
 end
end
