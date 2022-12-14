defmodule Rivet.Data.Ident.Action do
  @moduledoc """
  Schema for representing and working with a Ident.Acces.Db.
  """
  use TypedEctoSchema
  # use Rivet.Data.Ident.Config
  use Rivet.Ecto.Model, id_type: :int

  typed_schema "actions" do # #{@ident_table_actions}" do
    field(:name, Rivet.Utils.Ecto.Atom)
    field(:description, :string)
  end

  use Rivet.Ecto.Collection, required: [:name], update: [:description, :name]
end
