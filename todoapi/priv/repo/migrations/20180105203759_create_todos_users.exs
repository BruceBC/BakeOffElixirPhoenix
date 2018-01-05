defmodule Todoapi.Repo.Migrations.CreateTodosUsers do
  use Ecto.Migration

  def change do
    create table(:todos_users) do
      add :todo_id, references(:todos, type: :uuid)
      add :user_id, references(:users, type: :uuid)
    end

    create unique_index(:todos_users, [:todo_id, :user_id])
  end
end
