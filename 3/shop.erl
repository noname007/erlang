-module(shop).
-export([cost/1]).
-export([total/1]).

cost(oranges) -> 5;
cost(newspaper)->8;
cost(apples) -> 2;
cost(pears)  -> 9;
cost(milk) -> 7.


total([ {W,N} | T ])-> cost(W)*N + total(T);
total([])->0.

%shop:total([{apples,3},{pears,4}]).
