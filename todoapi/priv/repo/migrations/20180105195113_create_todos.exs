defmodule Todoapi.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :text, :string
      add :completed, :boolean
      timestamps()
    end
  end
end
