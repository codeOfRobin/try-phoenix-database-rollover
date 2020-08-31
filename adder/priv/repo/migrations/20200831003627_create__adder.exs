defmodule Adder.Repo.Migrations.Create_Adder do
  use Ecto.Migration

  def change do
    create table(:addition) do
      add :sum, :integer
    end
  end
end
