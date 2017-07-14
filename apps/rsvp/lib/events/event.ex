defmodule Rsvp.Event do
    use Ecto.Schema

    import Ecto.Changeset

    schema "events" do
        field :title, :string
        field :location, :string
        field :description, :string
        field :date, Ecto.DateTime

        timestamps()
    end

    @required_fields ~w(title location date)a
    @optional_fields ~w(description)a

    def changeset(event, params \\ %{}) do
        event 
        |> cast(params, @required_fields ++ @optional_fields)
        |> validate_required(@required_fields)
        |> validate_change(:date, &must_be_future/2)
    end

    defp must_be_future(test, value) do
        IO.inspect("Hello")
        IO.inspect(test)
        IO.inspect(Ecto.DateTime.compare(value, Ecto.DateTime.utc))
        Ecto.DateTime.compare(value, Ecto.DateTime.utc)
        |> IO.inspect
        |> get_error
    end

    defp get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]

    defp get_error(_), do: []
   

end