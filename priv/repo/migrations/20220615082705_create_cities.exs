defmodule ScrapingData.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :city, :string
      add :state, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end
  end
end
