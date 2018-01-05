defmodule TodoapiWeb.PageController do
  use TodoapiWeb, :controller

  def index(conn, %{"name" => name}) do
    conn
    |> send_resp(200, "Hello, #{name}!")
  end

end
