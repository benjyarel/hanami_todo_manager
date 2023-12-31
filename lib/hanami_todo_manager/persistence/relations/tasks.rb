# frozen_string_literal: true

module HanamiTodoManager
  module Persistence
    module Relations
      class Tasks < ROM::Relation[:sql]
        schema(:tasks, infer: true)
      end
    end
  end
end
