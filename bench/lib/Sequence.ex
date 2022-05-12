defmodule Sequence do
  @moduledoc """
  This module represents a sequence of elements defined by:
  f_1 = 0
  f_2 = 1
  f_3 = 1
  f_j = f_(j-1) - f_(j-2) + f_(j-3); j > 3
  """

  def r_take(1), do: 0
  def r_take(2), do: 1
  def r_take(3), do: 1
  def r_take(n) do
    r_take(n-1) - r_take(n-2) + r_take(n-3)
  end

  def take(n) do
    case rem(n, 4) do
      rem when rem < 2 -> 0
      rem when rem >= 2 -> 1
      _ -> {:error}
    end
  end
end
