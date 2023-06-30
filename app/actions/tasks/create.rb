# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Create < HanamiTodoManager::Action
        include Deps['persistence.rom']

        params do
          required(:task).hash do
            required(:title).value(:string)
            optional(:description).value(:string)
            optional(:due_date).value(:date)
          end
        end

        def handle(request, response)
          if request.params.valid?
            task = create_task(request.params[:task])

            succes_response(task, response)
          else
            error_response(request, response)
          end
        end

        private

        def create_task(task)
          rom.relations[:tasks].changeset(:create, task).commit
        end

        def succes_response(task, response)
          response.status = 201
          response.body = task.to_json
        end

        def error_response(request, response)
          response.status = 422
          response.format = :json
          response.body = request.params.errors.to_json
        end
      end
    end
  end
end
