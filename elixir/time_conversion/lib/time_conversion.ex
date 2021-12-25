defmodule TimeConversion do
  def timeConversion(s) do
    {t, am_pm} = String.split_at(s, String.length(s) - 2)
    [hh, rest] = String.split(t, ":", parts: 2)
    {hh, _r} = Integer.parse(hh)

    hh =
      hh +
        case am_pm do
          "AM" -> 0
          "PM" -> 12
        end

    :io_lib.format("~2..0b:~s", [hh, rest])
  end

  def main(_a) do
    s =
      case IO.gets("") do
        {:error, r} ->
          IO.puts(inspect(r))
          ""

        :eof ->
          ""

        data ->
          String.trim(data)
      end
    timeConversion(s)
  end

end
