defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  action_fallback HelloWeb.MyFallbackController

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

  def redirect_test1(conn, _params) do
    index_path = Routes.page_path(conn, :index)
    conn
    |> put_status(302)
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> redirect(to: index_path)
  end

  def redirect_test2(conn, _params) do
    redirect(conn, external: "https://elixir-lang.org")
  end

  def fallback_test(conn, _params) do
    { :error, "something" }
  end
end
