-module(geometry).
-export([area/1]).


area({rectangle,{Weight,Hight}})->
    Weight*Hight;

area({circle,R}) ->
    3.1415926*R*R;
area({square,W}) ->
    W*W;
area(_) ->
    error.
























