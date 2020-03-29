defmodule AdventOfCode.Y2019.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2019/day/1
  """
  use AdventOfCode.Data.InputReader, year: 2019, day: 1

  def run, do: {run_part1(), run_part2()}

  def run_part1 do
    input!()
    |> process_input()
    |> Stream.map(&fuel_required/1)
    |> Enum.sum()
  end

  def run_part2 do
    input!()
    |> process_input()
    |> Stream.map(&fuel_required/1)
    |> Stream.map(&fuel_for_fuel/1)
    |> Enum.sum()
  end

  defp process_input(data) do
    data
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  defp fuel_required(mass), do: Integer.floor_div(mass, 3) - 2

  defp fuel_for_fuel(mass_of_fuel) do
    cond do
      fuel_required(mass_of_fuel) <= 0 -> mass_of_fuel
      true -> mass_of_fuel + (mass_of_fuel |> fuel_required() |> fuel_for_fuel())
    end
  end
end
