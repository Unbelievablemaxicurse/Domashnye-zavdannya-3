-module(lesson3_task3).
-export([split/2]).

split(BinText, Delim) ->
    binary:split(BinText, Delim, [global, trim]).
