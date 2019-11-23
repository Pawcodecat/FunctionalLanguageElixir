defmodule FirstProject do


  def hello do
    :world
  end

  def add(first,second) do
    Enum.zip(first,second) |> Enum.map(&add_row/1)
  end
  def add_row({row1,row2})do
    Enum.zip(row1,row2) |> Enum.map(fn {a,b} -> a+b end)
  end

 def transponse(matrix) do
  matrix
  |> Enum.zip
  |> Enum.map(fn x-> Tuple.to_list(x) end)
 end


end
