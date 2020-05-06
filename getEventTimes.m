function events = getEventTimes(data)
%takes the eeg data and returns a list of the event times in latencies, first
%row is the sound that preceeds the task, the second row is the button
%presses after
    press = [];
    snd = [];
    for i = data.event
        %fprintf('Evaluating event at %s \n',i.latency);
        time = (cell2mat({i.latency})-1)/data.srate;
        %if isequal(i.type,'PRES__PRESS')
        %if isequal(i.type,'EVNT_PRES__PRESS')
        if isequal(i.type,'EVNT_PRES___PRESS') | isequal(i.type,'EVNT_PRES__PRESS') | isequal(i.type,'PRES__PRESS')
            press = [press, i.latency];
            %fprintf('Press number (%s) \n', int2str(length(press)));
        %elseif isequal(i.type,'STRT__SND_STRT1')
        %elseif isequal(i.type,'EVNT_SFIN__SND_STOP2')
        elseif isequal(i.type,'EVNT_STRT___SND_STRT1') |isequal(i.type,'EVNT_STRT__SND_STRT1') | isequal(i.type,'STRT__SND_STRT1')
            snd = [snd, i.latency];
            %fprintf('Sound number (%s) \n', int2str(length(snd)));
        end
    end
    events = [snd;press];
end