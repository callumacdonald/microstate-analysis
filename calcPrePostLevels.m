function [prea,posta,prel,postl] = calcPrePostLevels(eeg,labels)

events = getEventTimes(eeg);
validEvents = [];
% removes the events at the beginning and end of the recordings
for i = 1:length(events(1,:))
    if mod(i,6)~=0 & mod(i,6)~=1
        validEvents = [validEvents; events(1,i), events(2,i)];
    end
end


%%
%calc pre post alpha theta ratio
preRatios = [];
for i = 1:length(validEvents(:,1))
    preEventInterval = eeg.data(:,floor(validEvents(i,1)-12*eeg.srate):floor(validEvents(i,1)-2*eeg.srate));
    preEventStrengths=calcStrengthAcrossChannels(preEventInterval,eeg.srate);
    preAlpha = preEventStrengths(:,:,9:12);
    preTheta = preEventStrengths(:,:,4:7);
    
    preAlphaSums = [];
    preThetaSums = [];
    for j = 1:length(preAlpha(1,:,1))
        preAlphaSums = [preAlphaSums, sum(squeeze(preAlpha(:,j,:)),'all')];
        preThetaSums = [preThetaSums, sum(squeeze(preTheta(:,j,:)),'all')];
    end
    meanPreAlpha = mean(preAlphaSums);
    meanPreTheta = mean(preThetaSums);
    
    preRatios = [preRatios,meanPreAlpha/meanPreTheta];
    
end

postRatios = [];
for i = 1:length(validEvents(:,2))
    postEventInterval = eeg.data(:,floor(validEvents(i,2)):floor(validEvents(i,2)+10*eeg.srate));
    postEventStrengths=calcStrengthAcrossChannels(postEventInterval,eeg.srate);
    postAlpha = postEventStrengths(:,:,9:12);
    postTheta = postEventStrengths(:,:,4:7);
    postAlphaSums = [];
    postThetaSums = [];
    for j = 1:length(postAlpha(1,:,1))
        postAlphaSums = [postAlphaSums, sum(squeeze(postAlpha(:,j,:)),'all')];
        postThetaSums = [postThetaSums, sum(squeeze(postTheta(:,j,:)),'all')];
    end
    meanpostAlpha = mean(postAlphaSums);
    meanpostTheta = mean(postThetaSums);
    
    postRatios = [postRatios,meanpostAlpha/meanpostTheta];
    
end

%disp('PreRatios')
%disp(preRatios)
prea = preRatios;
% disp('PostRatios')
% disp(postRatios)
posta = postRatios;
% [h,p,ci,stats] = ttest(preRatios,postRatios);
% disp(h)
% disp(p)
% disp(ci)
% disp(stats)
%%
%%calc pre post average length
%use calcProportions and calcmeanlength

preLength = [];
preRatios=[];
for i = 1:length(validEvents(:,1))
    preLength = [preLength;calcMeanMicrostateLength(labels(floor(validEvents(i,1)-(12*eeg.srate)):floor(validEvents(i,1)-2*eeg.srate)))];
    preRatios = [preRatios;calcProportions(labels,[validEvents(i,1)-(12*eeg.srate),validEvents(i,1)-2*eeg.srate])];
end
preAvgLengths = [];
preLengths = preRatios.*preLength;

for i = 1:length(preRatios(:,1))
    preAvgLengths = [preAvgLengths, mean(preLengths(i,:))];
end
disp(preAvgLengths)

postLength = [];
postRatios=[];
for i = 1:length(validEvents(:,2))
    
    postLength = [postLength;calcMeanMicrostateLength(labels(floor(validEvents(i,2)):floor(validEvents(i,2)+10*eeg.srate)))];
    postRatios = [postRatios;calcProportions(labels,[validEvents(i,2),validEvents(i,2)+(10*eeg.srate)])];
end
postAvgLengths = [];
postLengths = postRatios.*postLength;

for i = 1:length(postRatios(:,1))
    postAvgLengths = [postAvgLengths, mean(postLengths(i,:))];
    
end

% disp('PreAvgLengths')
% disp(preAvgLengths)
prel=preAvgLengths;
% disp('PostAvgLengths')
% disp(postAvgLengths)
postl = postAvgLengths;
% [h,p,ci,stats] = ttest(preAvgLengths,postAvgLengths);
% disp(h)
% disp(p)
% disp(ci)
% disp(stats)
%%

end
%calc pre post transition probablilties















