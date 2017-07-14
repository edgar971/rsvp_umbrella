defmodule RsvpWeb.AuthorizedPlug do
    import Plug.Conn
    import Phoenix.Controller
    
    def init(opts) do
        opts
    end

    def call(conn, _) do
        username = conn.cookies["username"]
        authorized_user(conn, username)
    end

    defp authorized_user(conn, nil) do
        conn
        |> redirect(to: "/login")
        |> halt()
    end

    defp authorized_user(conn, _) do
        conn
    end
end