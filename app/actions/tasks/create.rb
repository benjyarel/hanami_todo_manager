# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Create < HanamiTodoManager::Action
      include Deps["persistence.rom"]
       
      params do
        required(:title).value(:string)
        optional(:description).value(:string)
        optional(:due_date).value(:date)
      end

        def handle(request, response)
          p request.params
        end
      end
    end
  end
end
