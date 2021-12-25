-module(miniMaxSum).
-import(lists,[duplicate/2, sum/1, zipwith/3, min/1, max/1]). 
-export([main/1, miniMaxSum1/1]).


miniMaxSum1(Arr) ->
    Sums = duplicate(length(Arr), sum(Arr)),
    Diffs = zipwith(fun(X,Y) -> X-Y end, Sums, Arr),
    io:fwrite("~.B ~.B~n", [min(Diffs), max(Diffs)]).

main(_a) -> 
    ArrTemp = re:split(re:replace(io:get_line(""), "\\s+$", "", [global, {return, list}]), "\\s+", [{return, list}]),

    Arr = lists:map(fun(X) -> {I, _} = string:to_integer(re:replace(X, "(^\\s+)|(\\s+$)", "", [global, {return, list}])), I end, ArrTemp),

    miniMaxSum1(Arr),

    ok.
