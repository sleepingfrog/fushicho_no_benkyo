defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, %{"_format" => "text"}) do
    conn
    |> put_status(202)
    |> text("""
      return
      text
      """)
  end

  def index(conn, %{"l" => "test"}) do
    conn
    |> put_layout("test.html")
    |> render("index.html")
  end


  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
