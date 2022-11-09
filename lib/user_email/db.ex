defmodule Cato.Data.Auth.UserEmails do
  use Core.Context
  use Cato.Data.Auth.CollectionUuid, model: Cato.Data.Auth.UserEmail

  ##############################################################################
  @doc """
  Helper function which accepts either user_id or user, and calls the passed
  function with the user model loaded including any preloads.  Send preloads
  as [] if none are desired.
  """
  def with_email(%Auth.UserEmail{} = email, preloads, func) do
    with {:ok, email} <- Auth.UserEmails.preload(email, preloads) do
      func.(email)
    end
  end

  def with_email(email, preloads, func) when is_binary(email) do
    case Auth.UserEmails.one([address: email], preloads) do
      {:error, _} = pass ->
        pass

      {:ok, %Auth.UserEmail{} = email} ->
        func.(email)
    end
  end
end