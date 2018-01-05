defmodule TodoapiWeb.Router do
  use TodoapiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TodoapiWeb do
    pipe_through :browser # Use the default browser stack
  end

   scope "/api", TodoapiWeb do
     pipe_through :api

     get "/hello/:name", PageController, :index
     get "/fib", FibController, :index
     get "/todos", TodoController, :index
     get "/todo/create/:text", TodoController, :create
     post "/todo/addUsers", TodoController, :addUsers
     get "/users", UserController, :index
     get "/user/create/:name", UserController, :create
   end
end
