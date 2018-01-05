defmodule Todoapi.Todo do
  use Todoapi.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  @derive {Poison.Encoder, only: [:id, :text, :completed, :inserted_at, :updated_at]}

  schema "todos" do
    field :text, :string
    field :completed, :boolean
    timestamps()
    many_to_many :users, Todoapi.User, join_through: "todos_users"
  end

  def changeset(todo, params \\ %{}) do
    todo
    |> Ecto.Changeset.cast(params, [:text, :completed])
    |> Ecto.Changeset.validate_required([:text])
  end

end