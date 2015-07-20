-module(mul_table).
-export([mul_table/1]).

%九九乘法表

%mul(X)->
%    N = lists:seq(1,X),
%    lists:map(fun(Y)-> X * Y end,N).

%mul_table(X)->
%    N = lists:seq(1,X),
%    lists:map(mul,N).


%mul_table(X)->
%    N = lists:seq(1,X),
%    Mul = fun(Y)->
%		  N1= lists:seq(1,Y),
%		  lists:map(fun(X1)->
%				    X1*Y 
%			    end,N1)
%	  end,
%   lists:map(Mul,N).

mul_table(X)->
    N = lists:seq(1,X),
    lists:map(fun mul/1,N).

mul(X)->
    N = lists:seq(1,X),
    Mul = fun(Y)->X*Y end,
    lists:map(Mul,N).
