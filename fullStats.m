
EEG = pop_loadset('filename','ppt_4.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt4 = processedData(EEG);

EEG = pop_loadset('filename','ppt_5.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt5 = processedData(EEG);

EEG = pop_loadset('filename','ppt_8.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt8 = processedData(EEG);

EEG = pop_loadset('filename','ppt_9.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt9 = processedData(EEG);

EEG = pop_loadset('filename','ppt_10.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt10 = processedData(EEG);

EEG = pop_loadset('filename','ppt_20.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt20 = processedData(EEG);

EEG = pop_loadset('filename','ppt_11.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt11 = processedData(EEG);

EEG = pop_loadset('filename','ppt_11.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt12 = processedData(EEG);

EEG = pop_loadset('filename','ppt_15.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt15 = processedData(EEG);

EEG = pop_loadset('filename','ppt_18.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt18 = processedData(EEG);

EEG = pop_loadset('filename','ppt_19.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt19 = processedData(EEG);

EEG = pop_loadset('filename','ppt_17.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt17 = processedData(EEG);

EEG = pop_loadset('filename','ppt_21.set','filepath','D:\\Meditation_materials\\data\\eeg_data\\Filtered sets\\');
ppt21 = processedData(EEG);


ppts = [ppt4,ppt5,ppt8,ppt9,ppt10,ppt11, ppt12, ppt15, ppt17, ppt18, ppt19, ppt21];
preA = []; postA = []; preL=[]; postL=[];
for i=1:length(ppts)
    preA = [preA,ppts(i).alphaPre];
    postA = [postA,ppts(i).alphaPost];
    preL = [preL,ppts(i).lengthPre];
    postL = [postL,ppts(i).lengthPost];    
end
[pa,tbla] = anova2(transpose([preA;postA]),16);
[pl,tbll] = anova2(transpose([preL;postL]),16);
%[p,tbl] = anova1(transpose(ppt4.lengthPre;ppt4.lengthPost));


early = []; late = [];
for j=1:length(ppts)
    for i=1:16
        if mod(i,4)==1 early = [early; ppts(j).alphaPre(i)-ppts(j).alphaPost(i)]; end
        if mod(i,4)==0 late = [late;ppts(j).alphaPre(i)-ppts(j).alphaPost(i)]; end
    end
end
[ph,tblh] = anova2([early,late],4);
onepre = []; onepost = [];twopre=[];twopost=[];threepre=[];threepost=[];fourpre=[];fourpost=[];
for j=1:length(ppts)
    for i=1:16
        if mod(i,4)==1 onepre = [onepre; ppts(j).alphaPre(i)];onepost = [onepost,ppts(j).alphaPost(i)]; end
        if mod(i,4)==2 twopre = [twopre; ppts(j).alphaPre(i)];twopost = [twopost,ppts(j).alphaPost(i)]; end
        if mod(i,4)==3 threepre = [threepre; ppts(j).alphaPre(i)];threepost = [threepost,ppts(j).alphaPost(i)]; end
        if mod(i,4)==0 fourpre = [fourpre; ppts(j).alphaPre(i)];fourpost = [fourpost,ppts(j).alphaPost(i)]; end
    end
end
