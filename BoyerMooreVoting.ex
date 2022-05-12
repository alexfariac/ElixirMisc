defmodule BoyerMooreVoting do
    @moduledoc """
        The Boyer–Moore majority vote algorithm is an algorithm for finding the majority of a sequence of elements using linear time and constant space.
    """
    @moduledoc since: "1.0.0"

    @doc """
    Find

    Returns the majority element in the list, or -1 if the list has no majority element.

    ## Examples

        iex> BoyerMooreVoting.find([1,7,2,7,8,7,7])
        7

        iex> BoyerMooreVoting.find([1,2,3])
        -1

        iex> BoyerMooreVoting.find([1,1,2,3])
        -1

    """
    @doc since: "1.0.0"

    def find(list) do
        candidate = voting(list)
        validate(list, candidate)
    end

    @spec voting(list(integer), integer, integer) :: integer
    defp voting(list, candidate \\ -1, count \\ 0)
    defp voting([], candidate, _), do: candidate
    defp voting([head|tail], _, 0) do
        voting(tail, head, 1)
    end
    defp voting([head|tail], candidate, count) when head == candidate do
        voting(tail, candidate, count+1)
    end
    defp voting([_|tail], candidate, count) do
        voting(tail, candidate, count-1)
    end

    @spec validate(list(integer), integer) :: integer
    defp validate(list, candidate, candidate_acc \\ 0, size_acc \\ 0)
    defp validate([], candidate, candidate_acc, size_acc) when candidate_acc > size_acc/2, do: candidate
    defp validate([], _, _, _), do: -1
    defp validate([head|tail], candidate, candidate_acc, size_acc) when head == candidate do
        validate(tail, candidate, candidate_acc+1, size_acc+1)
    end
    defp validate([_|tail], candidate, candidate_acc, size_acc) do
        validate(tail, candidate, candidate_acc, size_acc+1)
    end
end
