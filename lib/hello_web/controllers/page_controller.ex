defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout("test.html")
    |> render("index.html")
  end
end
