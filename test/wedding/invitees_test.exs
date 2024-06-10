defmodule Wedding.InviteesTest do
  use Wedding.DataCase

  alias Wedding.Invitees

  describe "invitees" do
    alias Wedding.Invitees.Invitee

    import Wedding.InviteesFixtures

    @invalid_attrs %{coming: nil, first_name: nil, group: nil, last_name: nil}

    test "list_invitees/0 returns all invitees" do
      invitee = invitee_fixture()
      assert Invitees.list_invitees() == [invitee]
    end

    test "get_invitee!/1 returns the invitee with given id" do
      invitee = invitee_fixture()
      assert Invitees.get_invitee!(invitee.id) == invitee
    end

    test "create_invitee/1 with valid data creates a invitee" do
      valid_attrs = %{
        coming: true,
        first_name: "some first_name",
        group: "some group",
        last_name: "some last_name"
      }

      assert {:ok, %Invitee{} = invitee} = Invitees.create_invitee(valid_attrs)
      assert invitee.coming == true
      assert invitee.first_name == "some first_name"
      assert invitee.group == "some group"
      assert invitee.last_name == "some last_name"
    end

    test "create_invitee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invitees.create_invitee(@invalid_attrs)
    end

    test "update_invitee/2 with valid data updates the invitee" do
      invitee = invitee_fixture()

      update_attrs = %{
        coming: false,
        first_name: "some updated first_name",
        group: "some updated group",
        last_name: "some updated last_name"
      }

      assert {:ok, %Invitee{} = invitee} = Invitees.update_invitee(invitee, update_attrs)
      assert invitee.coming == false
      assert invitee.first_name == "some updated first_name"
      assert invitee.group == "some updated group"
      assert invitee.last_name == "some updated last_name"
    end

    test "update_invitee/2 with invalid data returns error changeset" do
      invitee = invitee_fixture()
      assert {:error, %Ecto.Changeset{}} = Invitees.update_invitee(invitee, @invalid_attrs)
      assert invitee == Invitees.get_invitee!(invitee.id)
    end

    test "delete_invitee/1 deletes the invitee" do
      invitee = invitee_fixture()
      assert {:ok, %Invitee{}} = Invitees.delete_invitee(invitee)
      assert_raise Ecto.NoResultsError, fn -> Invitees.get_invitee!(invitee.id) end
    end

    test "change_invitee/1 returns a invitee changeset" do
      invitee = invitee_fixture()
      assert %Ecto.Changeset{} = Invitees.change_invitee(invitee)
    end
  end
end
