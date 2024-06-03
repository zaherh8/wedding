defmodule Wedding.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :wedding

  defp load_app do
    Application.load(@app)
  end
end
