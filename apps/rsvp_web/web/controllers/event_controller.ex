defmodule RsvpWeb.EventController do
    
    use RsvpWeb.Web, :controller

    def show(conn, %{"id" => id}) do
        event = Rsvp.EventQueries.get_by_id(id)
        render conn, "details.html", event: event
    end

    def list(conn, _params) do
        events = Rsvp.EventQueries.get_all()
        render conn, "list.html", events: events
    end

    def create(conn, %{errors: errors}) do
        render conn, "create.html", changeset: errors
    end

    def create(conn, _params) do
        changeset = Rsvp.Event.changeset(%Rsvp.Event{}, %{})
        render conn, "create.html", changeset: changeset
    end

    def add(conn, %{"event" => event}) do
        event = Map.update!(event, "date", fn d -> d <> ":00" end)
        changeset = Rsvp.Event.changeset(%Rsvp.Event{}, event)
        
        case Rsvp.EventQueries.create(changeset) do
            {:ok, %{id: id}} -> redirect conn, to: event_path(conn, :show, id)
            {:error, errors} -> create conn, %{errors: errors}
        end
        
    end

end