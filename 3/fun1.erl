-module(fun1).
-compile(export_all).

for(Max,Max,F) ->
 %   io:format("~p",Max),
    [F()];
for(I,Max,F)->
%    io:format("~p",I),
    [F()|for(I+1,Max,F)].

%for(Max,Max,F) ->
%   io:format("~p",Max),
%    [F()].

