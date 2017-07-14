defmodule RsvpWeb.EventView do
    use RsvpWeb.Web, :view

    def format_date(date) do
        IO.inspect(Ecto.DateTime.to_erl(date) )
        {{y, m, d}, _} = Ecto.DateTime.to_erl(date) 
        "#{m}/#{d}/#{y}"
    end
end