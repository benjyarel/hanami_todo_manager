# frozen_string_literal: true

module HanamiTodoManager
  module Actions
    module Tasks
      class Show < HanamiTodoManager::Action
      include Deps["persistence.rom"]
       
      params do
        required(:id).value(:integer)
      end

        def handle(request, response)
          requested_task_id = request.params[:id]

          task = rom.relations[:tasks].by_pk(requested_task_id).one

          if task
            response.format = :json
            response.body = task.to_json
          else
            not_found(response, requested_task_id)
          end
        end

        private

        def not_found(response, task_id)
          response.format = :json
          response.body = {error: "Cannot find task with id #{task_id}"}.to_json
          response.status = 404
        end
      end
    end
  end
end
