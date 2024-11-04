defmodule Shop.Repo do
  use Ecto.Repo,
    otp_app: :shop,
    adapter: Ecto.Adapters.SQLite3
end
