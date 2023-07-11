# frozen_string_literal: true

RSpec.describe HanamiTodoManager::Actions::Tasks::Destroy, type: [:request, :database] do
  describe 'DELETE tasks/' do
    let(:tasks) { app['persistence.rom'].relations[:tasks] }
    let(:task) { tasks.insert(title: 'I must be deleted') }
    
    context 'given valid params' do
      before do
        tasks.insert(title: 'I must be kept')
        delete "/tasks/#{task}"
      end
      
      it 'delete the task' do
        expect(last_response).to be_successful
      end
    end
  end
end