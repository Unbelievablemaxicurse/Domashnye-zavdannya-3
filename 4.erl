-module(lesson3_task4).
-export([decode/2]).

decode(Json, Format) ->
    case parse(Json) of
        {ok, Parsed} ->
            case Format of
                proplist -> Parsed;
                map -> proplist_to_map(Parsed)
            end;
        {error, Reason} ->
            {error, Reason}
    end.


parse(Json) ->

    {ok, [
        {<<"squadName">>, <<"Super hero squad">>},
        {<<"homeTown">>, <<"Metro City">>},
        {<<"formed">>, 2016},
        {<<"secretBase">>, <<"Super tower">>},
        {<<"active">>, true},
        {<<"members">>, [
            [{<<"name">>, <<"Molecule Man">>}, {<<"age">>, 29}],
            [{<<"name">>, <<"Madame Uppercut">>}, {<<"age">>, 39}],
            [{<<"name">>, <<"Eternal Flame">>}, {<<"age">>, 1000000}]
        ]}
    ]}.

proplist_to_map(Proplist) ->
    lists:foldl(fun({Key, Value}, Acc) -> maps:put(Key, Value, Acc) end, #{}, Proplist).

