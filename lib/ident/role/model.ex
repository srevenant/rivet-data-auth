defmodule Rivet.Data.Ident.Role do
  use TypedEctoSchema
  use Rivet.Ecto.Model, id_type: :int
  # use Rivet.Data.Ident.Config

  typed_schema "roles" do #{@ident_table_roles}" do
    field(:name, Rivet.Utils.Ecto.Atom)
    field(:domain, Rivet.Data.Ident.Access.Domains, default: :global)
    field(:description, :string)
  end

  use Rivet.Ecto.Collection,
    required: [:name, :description],
    update: [:description, :name, :domain]
end
