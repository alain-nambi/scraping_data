defmodule ScrapingData.Repo do
  use Ecto.Repo,
    otp_app: :scraping_data,
    adapter: Ecto.Adapters.Postgres
end
