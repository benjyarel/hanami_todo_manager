# frozen_string_literal: true

module HanamiTodoManager
  class Routes < Hanami::Routes
    root to: "home.show"

    get "/tasks", to: 'tasks.index'
    get "/tasks/:id", to: "tasks.show"
  end
end
