classdef processedData
    properties
        labels
        classes
        gfp
        gev
        alphaPre
        alphaPost
        lengthPre
        lengthPost
        chanlocs
        
        
    end
    methods
        function obj = processedData(EEG)
            EEG = pop_eegfiltnew(EEG, 'locutoff',2,'plotfreqz',1);
            EEG = pop_eegfiltnew(EEG, 'hicutoff',40,'plotfreqz',1);
            EEG = eeg_checkset(EEG);
            EEG = pop_reref(EEG, []);
            EEG = clean_artifacts(EEG, 'FlatlineCriterion',5,'ChannelCriterion',0.8,'LineNoiseCriterion',4,'Highpass','off','BurstCriterion','off','WindowCriterion','off','BurstRejection','on','Distance','Euclidian');
            obj.gfp = ComputeGFP(EEG.data);
            obj.chanlocs = EEG.chanlocs;
            [obj.classes, obj.labels, obj.gev] = ComputeMicrostatesKmeans(EEG.data,4,obj.gfp);
            [obj.alphaPre,obj.alphaPost,obj.lengthPre,obj.lengthPost] = calcPrePostLevels(EEG,obj.labels);
            
        end
        function r = saveTopos(fileLoc,ppt)
            for i=1:4
                figure ; topoplot(obj.classes(:,i),obj.chanlocs)
                fileroot = strcat(fileLoc,'\clean',num2str(pptLabels(ppt)),'_',num2str(i),'.jpg');
                saveas(gcf,fileroot)
                close
            end
            r='Success';            
        end
        
        
    end
    
end