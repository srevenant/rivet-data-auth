defmodule Rivet.Data.Ident.Test.UserTest do
  use Rivet.Data.Ident.Case, async: true

  doctest Rivet.Data.Ident.User, import: true
  doctest Rivet.Data.Ident.User.Db, import: true
  doctest Rivet.Data.Ident.User.Loader, import: true
  doctest Rivet.Data.Ident.User.Seeds, import: true
  doctest Rivet.Data.Ident.User.Graphql, import: true
  doctest Rivet.Data.Ident.User.Resolver, import: true
  doctest Rivet.Data.Ident.User.Rest, import: true
  doctest Rivet.Data.Ident.User.Cache, import: true

  describe "factory" do
    test "factory creates a valid instance" do
      assert %{} = dup_template = insert(:dup_template)
      assert dup_template.id != nil
    end
  end

  describe "build/1" do
    test "build when valid" do
      params = params_with_assocs(:dup_template)
      changeset = Db.DupTemplate.build(params)
      assert changeset.valid?
    end
  end

  describe "get/1" do
    test "loads saved transactions as expected" do
      c = insert(:dup_template)
      assert %Db.DupTemplate{} = found = Db.DupTemplates.one!(id: c.id)
      assert found.id == c.id
    end
  end

  describe "create/1" do
    test "inserts a valid record" do
      attrs = params_with_assocs(:dup_template)
      assert {:ok, dup_template} = Db.DupTemplates.create(attrs)
      assert dup_template.id != nil
    end
  end

  describe "delete/1" do
    test "deletes record" do
      dup_template = insert(:dup_template)
      assert {:ok, deleted} = Db.DupTemplates.delete(dup_template)
      assert deleted.id == dup_template.id
    end
  end
end
