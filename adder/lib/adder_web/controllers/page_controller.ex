defmodule AdderWeb.PageController do
  use AdderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
