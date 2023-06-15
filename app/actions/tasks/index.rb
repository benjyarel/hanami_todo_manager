module HanamiTodoManager
  module Actions
    module Tasks
      class Index <HanamiTodoManager::Action
        include Deps["persistence.rom"]

        def handle(params, response)
          tasks = rom.relations[:tasks].select(:title, :description, :due_date).to_a

          response.format = :json
          response.body = tasks.to_json
        end
      end
    end
  end
end