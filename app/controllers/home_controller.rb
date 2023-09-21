# class HomeController - sets up the entrypoint of the api
class HomeController < ApplicationController
  def index
    db_connection_test = Mongoid::Clients.default.command(ping: 1)
    timestamp = Time.now.utc
    memory_usage = `ps -o rss= -p #{Process.pid}`.to_i

    render json: {
      status: 'ok',
      database_connection: db_connection_test.documents,
      timestamp: timestamp,
      memory_usage_kb: memory_usage
    }
  end
end
