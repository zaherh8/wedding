defmodule Wedding.Invitees do
  @moduledoc """
  The Invitees context.
  """

  import Ecto.Query, warn: false
  alias Wedding.Repo

  alias Wedding.Invitees.Invitee

  @doc """
  Returns the list of invitees.

  ## Examples

      iex> list_invitees()
      [%Invitee{}, ...]

  """
  def list_invitees do
    Repo.all(Invitee)
  end

  def get_invitee_and_party(first_name, last_name) do
    first_name = first_name |> String.trim() |> String.downcase()
    last_name = last_name |> String.trim() |> String.downcase()

    if invitee =
         Repo.one(
           from(i in Invitee, where: i.first_name == ^first_name and i.last_name == ^last_name)
         ) do
      group = invitee.group

      group =
        if group not in [nil, ""],
          do: Repo.all(from(i in Invitee, where: i.group == ^group)),
          else: [invitee]

      {:ok, group}
    else
      {:error, :not_found}
    end
  end

  def update_invitees(invite_params) do
    Enum.each(invite_params, fn params ->
      invitee = get_invitee!(params.id)
      update_invitee(invitee, params)
    end)
  end

  def get_invitee!(id), do: Repo.get!(Invitee, id)

  @doc """
  Gets a single invitee.

  Raises `Ecto.NoResultsError` if the Invitee does not exist.

  ## Examples

      iex> get_invitee!(123)
      %Invitee{}

      iex> get_invitee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invitee!(id), do: Repo.get!(Invitee, id)

  @doc """
  Creates a invitee.

  ## Examples

      iex> create_invitee(%{field: value})
      {:ok, %Invitee{}}

      iex> create_invitee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invitee(attrs \\ %{}) do
    %Invitee{}
    |> Invitee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invitee.

  ## Examples

      iex> update_invitee(invitee, %{field: new_value})
      {:ok, %Invitee{}}

      iex> update_invitee(invitee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invitee(%Invitee{} = invitee, attrs) do
    invitee
    |> Invitee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invitee.

  ## Examples

      iex> delete_invitee(invitee)
      {:ok, %Invitee{}}

      iex> delete_invitee(invitee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invitee(%Invitee{} = invitee) do
    Repo.delete(invitee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invitee changes.

  ## Examples

      iex> change_invitee(invitee)
      %Ecto.Changeset{data: %Invitee{}}

  """
  def change_invitee(%Invitee{} = invitee, attrs \\ %{}) do
    Invitee.changeset(invitee, attrs)
  end
end
