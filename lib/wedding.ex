defmodule Wedding do
  @moduledoc """
  Wedding keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def format_names(names) do
    names |> Enum.map(&(&1 |> String.capitalize() |> String.trim()))
  end
end
