EEG = pop_mffimport('D:\Meditation_materials\data\eeg_data\Raw_MFFs\ppt_12.mff');
EEG = pop_eegfiltnew(EEG, 'locutoff',0.5,'plotfreqz',1);
EEG = pop_eegfiltnew(EEG, 'hicutoff',60,'plotfreqz',1);
EEG = eeg_checkset(EEG);
EEG = pop_reref( EEG, []);

% cut_post = [];
% cut_pre = []; 
gfp = ComputeGFP(EEG.data);
%[classes1, labels1, gev1] = ComputeMicrostatesKmeans(EEG.data,2,gfp);
%[classes2, labels2, gev2] = ComputeMicrostatesKmeans(EEG.data,3,gfp);
[classes3, labels3, gev3] = ComputeMicrostatesKmeans(EEG.data,4,gfp);
%[classes4, labels4, gev4] = ComputeMicrostatesKmeans(EEG.data,5,gfp);
%[classes5, labels5, gev5] = ComputeMicrostatesKmeans(EEG.data,6,gfp);
%disp(gev(3));

% %show the four classes computed
figure; topoplot(classes3(:,1),EEG.chanlocs)
figure; topoplot(classes3(:,2),EEG.chanlocs)
figure; topoplot(classes3(:,3),EEG.chanlocs)
figure; topoplot(classes3(:,4),EEG.chanlocs)
% %show their distrobutions in the first x seconds
% x=1000; a= [];
% for i = 1:x a=[a;calcProportions(labels,[i, i+1])]; end
% figure; histfit(a(:,1),20)
% figure; histfit(a(:,2),20)
% figure; histfit(a(:,3),20)
% figure; histfit(a(:,4),20)
disp('Starting PrePostLevels')
calcPrePostLevels();



% times = getEventTimes(EEG); %top row is task, bottom row is press. first press is times(2,1)
% times = times(:,2:end-1);
% %calculates the amount of times each state appears pre task and post task
% a= [];
% for i = times(1,:)
%     
%     for j = 1:100 a=[a;calcProportions(labels(4),[i+(j/10)-10, i+((j+1)/10)-10])]; end
%     
% end
% figure; histfit(a(:,2))
% b= [];
% for i = times(2,:)
%     
%     for j = 1:100 b=[b;calcProportions(labels(4),[i+(j/10), i+((j+1)/10)])]; end
%     
% end
% figure; histfit(b(:,2))
% %disp(gev);

