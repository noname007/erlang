-module(exercise).

% 8.11-1
-export([start/2]).



% start(AnAtom,Fun)->
%     register(AnAtom,spawn(Fun)).
% start()

% http://www.xuebuyuan.com/906402.html
main(_)->
    start(abc,fun()-> wait() end),
    start(abc,fun()-> wait()  end).

start(AnAtom,Fun)->
    try register(AnAtom,spawn(Fun)) of
            true->slef()!true
    catch
        error:_ ->
            io:format("false")
    end,
    
wait()->
    receive
        true->io:format("bing~~");
        false->io:format("bang~~")
    end.