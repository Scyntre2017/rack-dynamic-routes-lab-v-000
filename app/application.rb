require "pry"
class Application

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
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
  end
end
