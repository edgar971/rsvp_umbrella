unless(Rsvp.EventQueries.any) do
    Rsvp.EventQueries.create(Rsvp.Event.changeset(%Rsvp.Event{}, %{date: "2017-12-11 09:00:00", title: "Codefest", location: "Green Bay, WI"}))
    Rsvp.EventQueries.create(Rsvp.Event.changeset(%Rsvp.Event{}, %{date: "2017-11-12 10:00:00", title: "DockerCon", location: "Lehi, Utah"}))
end
