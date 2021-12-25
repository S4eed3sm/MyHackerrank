-module(timeConversion).
-export([main/1]).
-import(os, [getenv/1]).
-import(string, [left/2,right/2, split/3]).

%
% Complete the 'timeConversion' function below.
%
% The function is expected to return a STRING.
% The function accepts STRING s as parameter.
%

timeConversion(S) ->
    T = left(S, length(S)-2),
    AM_PM = right(S, 2),
    [HH,MM,SS] = split(T, ":", all),
    HHi = list_to_integer(HH) rem 12 + case AM_PM of
        "AM" -> 0;
        "PM" -> 12
    end,
    io_lib:format("~2..0b:~2..0s:~2..0s", [HHi, MM, SS]).

main(_args) ->
    {ok, Fptr} = file:open(getenv("OUTPUT_PATH"), [write]),

    S = case io:get_line("") of eof -> ""; SData -> re:replace(SData, "(\\r\\n$)|(\\n$)", "", [global, {return, list}]) end,

    Result = timeConversion(S),

    io:fwrite(Fptr, "~s~n", [Result]),

    file:close(Fptr),

    ok.