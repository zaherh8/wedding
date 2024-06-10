defmodule Wedding.Repo do
  use Ecto.Repo,
    otp_app: :wedding,
    adapter: Ecto.Adapters.Postgres
end
