defmodule Wedding.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :wedding
  @start_apps [:postgrex, :ecto, :ecto_sql]
  @all_repos [Wedding.Repo]

  defp start_apps() do
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)
  end

  # defp load_app do
  #   Application.load(@app)
  # end

  @doc """
  Create and migrate the wedding database automatically.

  If the database already exists, it won't be recreated.
  """
  def create_and_migrate() do
    start_apps()
    createdb()
    migrate()
  end

  defp createdb do
    for repo <- @all_repos do
      :ok = ensure_repo_created(repo)
    end

    IO.puts("Done creating database.")
  end

  defp ensure_repo_created(repo) do
    IO.puts("create #{inspect(repo)} database if it doesn't exist")

    case repo.__adapter__.storage_up(repo.config) do
      :ok -> :ok
      {:error, :already_up} -> :ok
      {:error, term} -> {:error, term}
    end
  end

  @doc """
  Migrate the database to the latest version.
  """
  def migrate() do
    start_apps()

    IO.puts("Start running migrations...")

    for repo <- @all_repos do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end

    IO.puts("Done migrating database.")
    :ok
  end
end
