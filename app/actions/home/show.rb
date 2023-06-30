# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Home
      class Show < HanamiTodoManager::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
