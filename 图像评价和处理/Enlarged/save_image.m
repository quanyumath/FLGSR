%% Enlarged paremeter
LeftUpPoint=[40,50];RightBottomPoint=[80,90];Enlargement_Factor=2;
%% method
Re_tensor{1}=ShowEnlargedRectangle(Z, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);  %Original
Re_tensor{2}=ShowEnlargedRectangle(O, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);  %Obeserved
Re_tensor{3}=ShowEnlargedRectangle(STTF, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
Re_tensor{4}=ShowEnlargedRectangle(TCTF_C, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
Re_tensor{5}=ShowEnlargedRectangle(Mrec, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
Re_tensor{6}=ShowEnlargedRectangle(TNN, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
Re_tensor{7}=ShowEnlargedRectangle(NCPC, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
Re_tensor{8}=ShowEnlargedRectangle(T_NTD, LeftUpPoint, RightBottomPoint, Enlargement_Factor, 1);
%% save
methodname={'Original.eps','Observed.eps','STTF.eps','TCTF.eps','TMac.eps','TNN.eps','NCPC.eps','NTD.eps'};
for i=1:8
    v=sprintf('%s%s%d','Flower_',methodname{i});
    filepath=fullfile('C:\Users\Spring527\Desktop\figure',v);
    saveas(imshow(Re_tensor{i}),filepath,'psc2');
end


