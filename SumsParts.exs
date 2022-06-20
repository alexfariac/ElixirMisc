defmodule SumsParts do

  def parts_sums(ls) do
    do_parts_sums(ls, Enum.sum(ls))
  end

  defp do_parts_sums(ls, sum, acc \\ 0)
  defp do_parts_sums([], _, _), do: [0]
  defp do_parts_sums([head|tail], sum, acc) do
    [sum - acc | do_parts_sums(tail, sum, acc + head)]
  end


  def aux_sp(xs) when xs == [], do: 0
  def aux_sp([x | _]) do x end
  def parts_sums_sp(ls) when ls == [], do: [0]
  def parts_sums_sp([x | xs]) do
    r = parts_sums_sp xs
    [(aux_sp r) + x | r]
  end

end

ExUnit.start()

defmodule SumsPartsTest do

  use ExUnit.Case, async: true

  test "parts_sums, empty list" do
    assert SumsParts.parts_sums_sp([]) == [0]
  end

  test "parts_sums, incremental monotonic list" do
    assert SumsParts.parts_sums_sp([1, 2, 3, 4, 5, 6]) == [21, 20, 18, 15, 11, 6, 0]
  end

  test "parts_sums, bigger list" do
    assert SumsParts.parts_sums_sp([744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]) == [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]
  end

  test "parts_sums, even bigger list" do
    u = [654379,430,3358426,885,902,96,933,672,895,7310034,6749922,905,1319962,4238020,722,565,558,133,48,217,5450103,3383902,966,7294724,686,3700414,4961574,278149,245,598,381]
    sol = [48710446,48056067,48055637,44697211,44696326,44695424,44695328,44694395,44693723,44692828,37382794,30632872,30631967,29312005,25073985,25073263,25072698,
           25072140,25072007,25071959,25071742,19621639,16237737,16236771,8942047,8941361,5240947,279373,1224,979,381,0]

    assert SumsParts.parts_sums(u) == sol
  end

end
