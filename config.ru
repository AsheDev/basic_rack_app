require 'json'

class Router
  def initialize(routes)
    @routes = routes
  end

  def four_oh_four
    [404, {'Content-Type' => 'application/json'}, ["Not Found!"]]
  end

  def call(env)
    route = routes.detect do |r|
      env['REQUEST_PATH'].match(r[:path]) && env['REQUEST_METHOD'] == r[:method]
    end

    route ? route[:route].call(env, env['REQUEST_PATH']) : four_oh_four
  end

  private
  attr_reader :routes
end

class Endpoints
  class << self
    def quotes
      [
        "There's nothing wrong with having a tree as a friend.",
        "The secret to doing anything is believing that you can do it. Anything that you believe you can do strong enough, you can do. Anything. As long as you believe.",
        "If what you're doing doesn't make you happy, you're doing the wrong thing."
      ]
    end

    def root
      Proc.new do |env, match|
        [
          200,
          {"Content-Type" => "application/json"},
          [{"bobRossSays" => quotes[Random.rand(0..2)]}.to_json]
        ]
      end
    end
  end
end

# If a new route is added be sure to add it _before_ the root route so that
# the matching within Router can do its thing properly
run Router.new([
  {
    :path => %r{^/},
    :method => "GET",
    :route => Endpoints.root
  }
]);
