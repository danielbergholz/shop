defmodule ShopWeb.Plugs.SetConsole do
  import Plug.Conn

  @valid_consoles ["nintendo", "pc", "playstation", "xbox"]
  @cookie_max_age :timer.hours(1)

  def init(default_console), do: default_console

  def call(%Plug.Conn{:params => %{"console" => console}} = conn, _default_console)
      when console in @valid_consoles do
    conn
    |> assign(:console, console)
    |> put_resp_cookie("console", console, max_age: @cookie_max_age)
  end

  def call(%Plug.Conn{:cookies => %{"console" => console}} = conn, _default_console)
      when console in @valid_consoles do
    conn
    |> assign(:console, console)
  end

  def call(%Plug.Conn{} = conn, default_console) do
    conn
    |> assign(:console, default_console)
    |> put_resp_cookie("console", default_console, max_age: @cookie_max_age)
  end
end
