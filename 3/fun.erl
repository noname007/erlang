-module(fun).
-export([CF/1]).

CF(X)->
    fun({c,V})->
	    32 + V * 9 /5;
       {f,V}->
	    (V-32)*5/9.

	    
