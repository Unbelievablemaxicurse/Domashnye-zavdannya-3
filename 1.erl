-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) ->
    case binary:split(BinText, <<" ">>, [global, trim]) of
        [Word | _] -> Word;
        [] -> <<>> 
    end.
