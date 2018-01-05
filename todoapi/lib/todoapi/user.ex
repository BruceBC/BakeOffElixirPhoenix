defmodule Todoapi.User do
  use Todoapi.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  @derive {Poison.Encoder, only: [:id, :name, :inserted_at, :updated_at]}

  schema "users" do
    field :name, :string
    timestamps()
    many_to_many :todos, Todoapi.Todo, join_through: "todos_users"
  end

  def changeset(todo, params \\ %{}) do
    todo
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end

end
