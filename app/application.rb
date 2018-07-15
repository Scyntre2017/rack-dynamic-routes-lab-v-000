require "pry"
class Application

  @@items = [Item.new("Bananas", 1.19), Item.new("Watermelon", 3.87)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
