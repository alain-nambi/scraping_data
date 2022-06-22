defmodule ScrapingData.Repo do
  use Ecto.Repo,
    otp_app: :scraping_data,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
