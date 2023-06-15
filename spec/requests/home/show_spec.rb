# frozen_string_literal: true

RSpec.describe "Root", type: :request do
  it "redirects to the Home#Show" do
    get "/"
    
    expect(last_response).to be_successful
    expect(last_response.body).to eq("HanamiTodoManager::Actions::Home::Show")
  end
end
