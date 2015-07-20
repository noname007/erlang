-module(clock).
-export([start/2,stop/0]).

%变量的作用域是怎么样的呢？ clock

start(Time,Fun)-> 
    Clock = clock,
    register(Clock,spawn(fun()->tick(Time,Fun) end)).
stop()->clock!stop.

tick(Time,Fun)->
    receive
        stop->
            void
    after Time->
            Fun(),
            tick(Time,Fun)
    end.
