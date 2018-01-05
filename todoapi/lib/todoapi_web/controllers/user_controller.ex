defmodule TodoapiWeb.UserController do
  use TodoapiWeb, :controller

  alias Todoapi.User
  alias Todoapi.Repo

  def index(conn, _params \\ %{}) do
    users = Repo.all(User)
    conn
    |> json(users)
  end

  def create(conn, %{"name" => name_params}) do
    changeset = User.changeset(%User{}, %{name: name_params})

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> json(user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: "error", message: changeset})
    end

  end

end