function [stat] = calcMicrostateStats(labels, times)
%takes in the list of labels and times in seconds, and the interval used to
%calculate sd is one second
%
    %total = calcProportions(labels, times);
    %avg = interval*total/(times(2)-times(1));
    %disp(avg)
    length = times(2)-times(1);
    if mod(length,1)~=0
        disp("interval does not fit into period")
        return;
    end
    vals=[];
    n=(length);
    for i = 0:n-1
        vals = [vals; calcProportions(labels, [(times(1)+i) (times(1)+i+1)])];
        %disp(vals)
    end
    sd = [std(vals(:,1)),std(vals(:,2)),std(vals(:,3)),std(vals(:,4))];
    avg = [mean(vals(:,1)),mean(vals(:,2)),mean(vals(:,3)),mean(vals(:,4))];
    stat = [avg; sd];
end