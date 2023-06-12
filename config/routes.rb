# frozen_string_literal: true

module HanamiTodoManager
  class Routes < Hanami::Routes
    root to: "home.show"
  end
end
