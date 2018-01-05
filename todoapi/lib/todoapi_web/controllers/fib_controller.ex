defmodule TodoapiWeb.FibController do
  use TodoapiWeb, :controller

  def index(conn, _params) do
    text conn, "#{findFibonnaci}"
  end

  # value
  def findFibonnaci(n, a, b, f) when n > 10000 do
    f
  end

  # loop
  def findFibonnaci(n \\ 2, a \\ 0, b \\ 1, f \\ 1) do
    findFibonnaci(n + 1, b, a + b, a + b)
  end

end
