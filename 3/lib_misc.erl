-module(lib_misc).
-export([split_2_odds_and_evens/1]).
%-export([odds_and_evens/3]).


%提取一个整数列表中的====奇数、偶数、
split_2_odds_and_evens(L)->
	odds_and_evens(L,[],[]).

odds_and_evens([H|T],Odds,Evens)->
	case (H rem 2) of
		1 -> odds_and_evens(T,[H|Odds],Evens);
		0 -> odds_and_evens(T,Odds,[H|Evens])
	end;
odds_and_evens([],Odds,Evens)->
	{lists:reverse(Odds),lists:reverse(Evens)}.


