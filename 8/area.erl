%Pid = spawn(Fun)
%Pid!message
%
-module(area).
-export([loop/0]).
-compile(export_all).

loop()->
    receive
	{rectangel,Width,Ht}->
	    io:format("Area of rectangle is ~p~n",[Width*Ht]),
	    loop();
	{circle,R} ->
	    io:format("Area of circle is ~p~n",[3.1415926 * R *R]),
	    loop();
	Other ->
	    io:fomat("no this shap ~p~n",[Other]),
	    loop()
    end.
%receive and send

loop_r_s()->
    receive
	{From,{circle,R}}->
	    From!{self(),3.14*R*R},
%	    io:format("From ~w~n",From),
%	    io:format("Area of circle is ~p~n",[3.14*R*R]),
	    loop_r_s();
	{From,{rectangle,W,H}} ->
	    From!{self(),W*H},
%	    io:format("Area of circle is ~p~n",[W*H]),
	    loop_r_s();
	{From,Other} ->
	    From!{self(),{error,Other}},
	    io:format("From ~w~n",From),
%	    io:format("Area of ~p is not known",Other),
	    loop_r_s()
    end.


rpc(Pid,Request)->
    Pid!{self(),Request},
    receive
	{Pid,Response}->
	    Response
    end.
    


