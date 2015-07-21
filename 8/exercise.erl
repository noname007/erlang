-module(exercise).

% 8.11-1
% -export([start/2,main/1,stop/0]).
-export([start/2,stop/0,wait/0,main/1]).



% start(AnAtom,Fun)->
%     register(AnAtom,spawn(Fun)).
% start()

% http://www.xuebuyuan.com/906402.html
main(_)->
    start(abc,fun()-> wait() end),
    start(abc,fun()-> wait()  end).

start(AnAtom,Fun)->
    try register(AnAtom,spawn(Fun)) of
        true->io:format("success~n")
    catch
        error:_ ->
            io:format("false~n")
    end.


stop()->
    abc!false.


wait()->
    receive
        true->io:format("bing~~~n");
        false->io:format("bang~~~n")
    end.



% 8.11-2
-compile(export_all).
start(Num) ->
    % cancel(),
    unregister(circle_head),
    register(circle_head, spawn(fun() -> create(Num)end)).


send_message(N) ->
    for(0, N, fun(_I) -> circle_head ! _I end).


cancel(N) ->
    for(0, N, fun(_I) -> circle_head ! cancel end).

create(0) ->
    self();
create(Num) ->
    Pid = spawn(fun() -> create(Num - 1) end),
    io:format("self Pid:~p create process:~p~n", [self(), Pid]),
    loop(Pid,Num).

loop(Pid,Num) ->
    receive
        cancel ->
            Pid ! cancel,
            cancel;
        Any ->
            % io:format("Pid:~p receive:~p~n", [self(), Any]),
            Pid ! Any,
            io:format("ddd self:~p Pid:~p,create_at_num:~p receive:~p~n", [self(),Pid, Num,Any]),
            loop(Pid,Num)
    end.
for(N,N,F)->[F(N)];
for(I,N,F)->[F(I) | for(I + 1,N,F)].