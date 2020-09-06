defmodule AdderWeb.AddingController do
  use AdderWeb, :controller
  require Ecto.Query
  require Adder.Repo

  def add(conn, _params) do
<<<<<<< HEAD
    {:ok, _} = Ecto.Adapters.SQL.query(Adder.Repo, "UPDATE Addition SET sum=sum+1")
    {:ok, results} = Ecto.Adapters.SQL.query(Adder.Repo, "SELECT * from Addition")
    [[_, sum]] = results.rows
    json(conn, %{sum: sum})
=======
    {:ok, dict} =
      Adder.Repo.transaction(fn ->
        addition =
          Adder.Addition
          |> Ecto.Query.first()
          |> Ecto.Query.lock("FOR UPDATE")
          |> Adder.Repo.one()

        changeset = Adder.Addition.changeset(addition, %{sum: addition.sum + 1})
        Adder.Repo.update(changeset)

        %{sum: addition.sum + 1}
      end)

    json(conn, dict)
>>>>>>> use transactions
  end

  def reset() do
    addition =
      Adder.Addition
      |> Ecto.Query.first()
      |> Ecto.Query.lock("FOR UPDATE")
      |> Adder.Repo.one()

    changeset = Adder.Addition.changeset(addition, %{sum: 0})
    Adder.Repo.update(changeset)
  end
end
