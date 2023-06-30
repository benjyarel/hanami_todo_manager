# frozen_string_literal: true

require "hanami"

module HanamiTodoManager
  class App < Hanami::App
    #allow to parse the body of request to allow request.params[:toto]
    config.middleware.use :body_parser, :json
  end
end
