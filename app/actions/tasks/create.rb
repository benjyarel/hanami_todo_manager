# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Create < HanamiTodoManager::Action
      include Deps["persistence.rom"]
       
      params do
        required(:title).value(:string)
        optional(:description).value(:string)
        required(:due_date).value(:date)
      end

        def handle(request, response)
          p params
        end
      end
    end
  end
end
