defmodule ScrapingData.Scraper do
  def run do
    {:ok, %Finch.Response{body: body}} =
      Finch.build(:get, "https://www.latlong.net/category/cities-236-15.html")
      |> Finch.request(MyFinch)

    body
  end
end
