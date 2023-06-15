module HanamiTodoManager
  module Actions
    module Tasks
      class Index <HanamiTodoManager::Action
        include Deps["persistence.rom"]
        
        def handle(params, response)
          tasks = rom.relations[:tasks].to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end