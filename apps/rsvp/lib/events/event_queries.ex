defmodule Rsvp.EventQueries do
    import Ecto.Query

    alias Rsvp.{Repo, Event}

    def get_all do 
        Repo.all(from Event)
    end

    def get_all_for_location(location) do
        query = from e in Event,
            where: e.location == ^location

        Repo.all(query)
    end

    def get_by_id(id) do 
        Repo.get(Event, id)
    end

    def create(event) do
        Repo.insert!(event)
    end
end