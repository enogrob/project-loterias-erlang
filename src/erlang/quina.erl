-module(quina).
-export([new/0, new/1, sum/1, columns/1]).

new() ->
  new(5).

new(N) ->
  new(N, []).

new(0, Q) ->
  shell:strings(false),
  lists:sort(Q);
new(N, Q) ->
  E = rand:uniform(80),
  Is_member = lists:member(E, Q),
  if
    Is_member == false ->
      new(N - 1, [E | Q]);
    true ->
      new(N, Q)
  end.

% Probability according to the sum
% of the quina members.
% 167 =< 54,3% <= 242
sum(Q) ->
  sum(Q, 0).

sum([], S) ->
  S;
sum([Q|Qs], S) ->
  sum(Qs, S+Q).

% Probability according to the column
% of the quina members.
% Maximum 2
columns(Q) ->
  F = fun(E) -> round((E/10 - trunc(E/10)) * 10) end,
  lists:map(F, Q).
