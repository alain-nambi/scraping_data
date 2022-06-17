defmodule ScrapingDataWeb.ScrapingLive do
  use ScrapingDataWeb, :live_view

  alias ScrapingData.Cities
  alias ScrapingData.Scraper

  def mount(_session, _params, socket) do
    list_cities = Cities.list_cities()

    {:ok,
      socket
      |> assign(
          list_cities: list_cities
        )
    }
  end

  def handle_event("insert-data", %{}, socket) do
    case Scraper.run() do
      _ok -> {:noreply, socket |> assign(list_cities: Cities.list_cities)}
    end
  end

  def handle_event("remove-all-data", %{}, socket) do
    case Cities.delete_all_city do
      {_number, _nil} -> {:noreply, socket |> assign(list_cities: Cities.list_cities)}
    end
  end

end
