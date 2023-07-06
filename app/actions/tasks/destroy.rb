# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Destroy < HanamiTodoManager::Action
        include Deps['persistence.rom']

          params do
            required(:id).value(:integer)
          end

          def handle(request, response)
            return error_response(request, response, 422) unless request.params.valid?

            requested_task_id = request.params[:id]

            task = find_task(requested_task_id)
            delete_task(task)

            task? succes_response(response, requested_task_id) : error_response(request, response, 400)
   
          end

        private

        def find_task(id)
          rom.relations[:tasks].by_pk(id).one
        end

        def delete_task(task)
          p "before"
          p rom.relations[:tasks]
          task.delete
          p "after"
          p rom.relations[:tasks]
        end

        def succes_response(response, task_id)
          response.status = 200
          response.body = task_id
        end

        def error_response(request, response, status)
          response.format = :json


          if status === 400
            response.status = status
            response.body = "Task not found"
          else 
            response.status = status
            response.body = request.params.errors.to_json
          end
        end

      end
    end
  end
end