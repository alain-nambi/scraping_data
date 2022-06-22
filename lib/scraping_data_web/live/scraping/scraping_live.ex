defmodule ScrapingDataWeb.ScrapingLive do
  use ScrapingDataWeb, :live_view

  alias ScrapingData.Cities
  alias ScrapingData.Scraper

  def mount(socket) do
    {:ok, socket}
  end

  def handle_event("insert-data", %{}, socket) do
    case Scraper.run() do
      _ok -> {:noreply, socket |> assign(list_cities: Cities.list_cities())}
    end
  end

  def handle_event("remove-all-data", %{}, socket) do
    case Cities.delete_all_city() do
      {_number, _nil} -> {:noreply, socket |> assign(list_cities: Cities.list_cities())}
    end
  end

  def handle_event("delete-cities-by-id", %{"id" => id}, socket) do
    Cities.delete_city(id)
    {:noreply, socket |> assign(list_cities: Cities.list_cities())}
  end

  def handle_event("page-navigation", %{"page" => page}, socket) do
    {:noreply, push_redirect(socket, to: Routes.scraping_path(socket, :scraping, page: page))}
  end

  def handle_params(params, _uri, socket) do
    list_cities = Cities.paginate_cities(params)

    {:noreply, socket |> assign(list_cities: list_cities)}
  end
end
