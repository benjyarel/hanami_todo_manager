# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Create < HanamiTodoManager::Action
      include Deps["persistence.rom"]
       
      params do
        required(:task).hash do
          required(:title).value(:string)
          optional(:description).value(:string)
          optional(:due_date).value(:date)
        end
      end

        def handle(request, response)

          if request.params.valid?
            task = rom.relations[:tasks].changeset(:create, request.params[:task]).commit
            response.status = 201
            response.body = task.to_json
          else

            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end
        end
      end
    end
  end
end
