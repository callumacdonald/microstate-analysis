function [totals] = calcProportions(labels, times, ~)
%takes labels as an array of labeled states from the eeg measurements, and times as a pair of times in latencies 
    srate = 500;
    start = floor(times(1));
    stop  = floor(times(2));
    oneTotal = 0;
    twoTotal = 0;
    threeTotal = 0;
    fourTotal = 0;
    for i = start:stop
        switch labels(i)
            case 1
                oneTotal = oneTotal+1;
                %disp("one"+oneTotal)
            case 2
                twoTotal = twoTotal+1;
                %disp("two"+twoTotal)
            case 3
                threeTotal = threeTotal+1;
                %disp("three"+threeTotal)
            case 4
                fourTotal = fourTotal+1;
                %disp("four"+fourTotal)
            otherwise
                %disp("Too many cases")
        end
    end
    t=oneTotal+twoTotal+threeTotal+fourTotal;
    totals = [oneTotal/t, twoTotal/t, threeTotal/t, fourTotal/t];
end
