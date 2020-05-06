function [avgs, sds, freqs] = calcMeanMicrostateLength(lab)
%takes the labels of the period you want (you need to prespecifiy before
%feeding the labels in) and calculates how long each state lasts on average
% changes=0;
% for i = 1:length(labels)-1
%     if labels(i)==labels(i+1) changes=changes+1;end
% end
% len=changes/length(labels);


one = []; two = []; three = []; four = [];

%creates the first digits position in the labels
switch lab(1)
    case 1
        one = [one, 1];
    case 2
        two = [two, 1];
    case 3
        three = [three, 1];
    case 4
        four = [four, 1];
end
%if the next digit is the same, augment the number of times it has appeared
%by one
for i = 1:length(lab)-1
    if lab(i)==lab(i+1) 
        switch lab(i)
            case 1
                one(end)=one(end)+1;
            case 2
                two(end)=two(end)+1;
            case 3
                three(end)=three(end)+1;
            case 4
                four(end)=four(end)+1;
        end
    else %else create one in the next occurence
        switch lab(i+1)
            case 1
                one = [one, 1];
            case 2
                two = [two, 1];
            case 3
                three = [three, 1];
            case 4
                four = [four, 1];      
        end
    end
                
end
freqs = [500./one, 500./two, 500./three, 500./four];
avgs = [mean(one), mean(two), mean(three), mean(four)];
sds = [std(one), std(two), std(three), std(four)];
if isempty(one) avgs(1)=0; sds(1)=0; end
if isempty(two) avgs(2)=0; sds(2)=0; end
if isempty(three) avgs(3)=0; sds(3)=0; end
if isempty(four) avgs(4)=0; sds(4)=0; end

end


