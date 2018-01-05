defmodule TodoapiWeb.TodoController do
  use TodoapiWeb, :controller

  alias Todoapi.Todo
  alias Todoapi.User
  alias Todoapi.Repo

  def index(conn, _params \\ %{}) do
    todos = Repo.all(Todo)
    conn
    |> json(todos)
  end

  def create(conn, %{"text" => text_params}) do
    changeset = Todo.changeset(%Todo{}, %{text: text_params, completed: false})

    case Repo.insert(changeset) do
      {:ok, todo} ->
        conn
        |> put_status(:created)
        |> json(todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: "error", message: changeset})
    end

  end

  def addUsers(conn, %{"_json" => json_params}) do
    json_user = Enum.at(json_params, 0)
    id = json_user["id"]
    # TODO: Figure out why I cannot grab a todo from the databse and then prelod users, etc...
    #todo = Todo |> Repo.get("dde861f8-68fd-4853-9799-b2677eba647c")
    changeset = Todo.changeset(%Todo{}, %{text: "testing", completed: false})
    todo = Repo.insert!(changeset)
    user = User |> Repo.get(id)

    todo
    |> Repo.preload(:users)
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:users, [user])
    |> Repo.update!

    users = Repo.all(Ecto.assoc(todo, :users))

    conn
    |> json(users)
  end

end
