# frozen_string_literal: true

RSpec.describe HanamiTodoManager::Actions::Tasks::Create, type: %i[request database] do
  describe 'POST tasks/' do
    context 'given valid params' do
      let(:params) do
        { task: { title: 'Be better at coding', description: 'Wow', due_date: Time.now } }
      end

      it 'creates a task' do
        post '/tasks', params

        expect(last_response).to be_created
      end
    end

    context 'given invalid params' do
      let(:params) do
        { task: { title: nil } }
      end

      it 'returns 422 unprocessable' do
        post '/tasks', params

        expect(last_response).to be_unprocessable
      end
    end
  end
end
