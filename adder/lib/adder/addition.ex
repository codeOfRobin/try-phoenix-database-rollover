defmodule Adder.Addition do
  use Ecto.Schema

  schema "addition" do
    field :sum, :integer
  end

  def changeset(addition, params) do
    addition
    |> Ecto.Changeset.cast(params, [:sum])
  end
end
