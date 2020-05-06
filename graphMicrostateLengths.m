%function [] = graphMicrostateLengths(labels)


%get the list of numbers to graph
t = 1:561;
meanLens = [];
meanErrs = [];
for i=0:560
    start = i*2000+1;
    stop = (i+1)*2000+1;
    labelSub=labels(start:stop);
    [a,s]=calcMeanMicrostateLength(labelSub);
    meanLens = [meanLens,a(3)];
    meanErrs = [meanErrs,s(3)];
end

ev=zeros(1,561);
for i=1:length(EEG.event)

    ev(ceil(EEG.event(i).latency/2000))=50;
end
%disp(ev)
%graph them
%errorbar(t,meanLens,meanErrs)
plot(t,meanLens)
hold on
plot(t,ev(1:561))
hold off