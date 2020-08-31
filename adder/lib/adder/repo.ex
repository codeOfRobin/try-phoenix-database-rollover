defmodule Adder.Repo do
  use Ecto.Repo,
    otp_app: :adder,
    adapter: Ecto.Adapters.Postgres
end
