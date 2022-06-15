defmodule ScrapingDataWeb.ScrapingLive do
  use ScrapingDataWeb, :live_view

  alias ScrapingData.Cities

  def mount(_session, _params, socket) do
    list_cities = Cities.list_cities()

    {:ok,
      socket
      |> assign(list_cities: list_cities)
    }
  end
end
