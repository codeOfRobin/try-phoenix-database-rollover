defmodule AdderWeb.AddingController do
  use AdderWeb, :controller
  require Ecto.Query
  require Adder.Repo

  def add(conn, _params) do
    addition = Adder.Addition |> Ecto.Query.first() |> Adder.Repo.one()
    changeset = Adder.Addition.changeset(addition, %{sum: addition.sum + 1})
    Adder.Repo.update(changeset)
    json(conn, %{sum: addition.sum + 1})
  end
end
