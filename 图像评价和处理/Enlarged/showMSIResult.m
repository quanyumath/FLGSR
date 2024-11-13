function showMSIResult(Re_msi,Omsi,minI,maxI,methodname,enList,band2show)
%% Use to show the video result of TC methods

numLine = ceil((length(enList)+2)/8);
% figure('units','normalized','position',[0.05,0.482-0.29*3/2,0.9,0.29*3],'name','video');
%% UI
close all;

figure('units','normalized','position',[0.05,0.482-0.29*numLine/2,0.9,0.29*numLine],'name','MSI');
showShow(band2show)

    function showShow(band2show)
        numLine = ceil((length(enList)+1)/8);

        subplot(numLine,8,1); imshow((Omsi-minI)/(maxI-minI)),title( 'Original');
        for i = 1:length(enList)
            subplot(numLine,8,i+1);
            imshow((Re_msi{enList(i)}-minI)/(maxI-minI));title(methodname{enList(i)});
        end
    end
end