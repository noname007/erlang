-module(kvs).
-export([start/0,store/2,lookup/1]).

start()->
    unregister(kvs),
    register(kvs,spawn(fun()-> loop() end)).

store(Key,Value)->
    rpc({store,Key,Value}).

lookup(Key)->
    rpc({lookup,Key}).

rpc(Q)->
    kvs!{self(),Q},
    receive
        {kvs,Reply}->
            Reply
    end.

loop()->
    receive
        {From,{store,Key,Value}}->
            put(Key,{ok,Value}),
            io:format("put kvs:~p self:~p",[kvs,self()]),
            From! {kvs,true},
            % From! {self(),true}, %wrong
            loop();
        {From,{lookup,Key}}->
            io:format("get kvs:~p self:~p",[kvs,self()]),
            From !{kvs,get(Key)},
            % From !{self(),get(Key)},
            loop()
    end.
