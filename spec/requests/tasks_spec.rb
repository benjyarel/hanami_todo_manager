RSpec.describe "GET /tasks", type: [:request, :database] do
  let(:tasks) { app["persistence.rom"].relations[:tasks] }

  before do
    tasks.insert(title: "Learn Hanami 2.0", description: "Because it's looking fun to play with")
    tasks.insert(title: "clean your socks", description: "Wearing them 3 days is too much", due_date: Time.now)
  end

  it "returns a list of task" do
    get "/tasks"

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)

    expect(response_body.size).to eq(2)
    expect(response_body.first).to eq({'title' =>  "Learn Hanami 2.0", 'description' =>  "Because it's looking fun to play with", "due_date" => nil})
  end
end
