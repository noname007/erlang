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