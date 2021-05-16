defmodule HelloWeb.MyFallbackController do
  use Phoenix.Controller

  def call(conn, params) do
    IO.puts(inspect(params))
    conn
    |> put_status(500)
    |> text("error")
  end
end
