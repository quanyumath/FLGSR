clc
clear
currentFolder = pwd; addpath(genpath(currentFolder));

%% 导入数据
indimgs = [1:300];
i = 3; id = indimgs(i);
pic_name = ['Image/', num2str(id), '.tiff'];
I = double(imread(pic_name));
X = I / 255; %imshow(X)
if size(X, 3) == 3 X = rgb2gray(X); end
er = 100; % 60 /100

%% 样本率
sr = 0.7; [m, n] = size(X);
Omega = find(rand(numel(X), 1) < sr);
H = zeros(size(X)); H(Omega) = X(Omega); %imshow(H) imwrite(H,'11.tiff');
Nway = size(X); data = X(Omega);

%% FLGSR

opts = [];
opts.maxit = 100; 
opts.tol = 1e-3; % 5e-3 / 8e-3 /5e-4
opts.eta = 1e-3; 
opts.rho = [0.999, 0.5, 0.5];
opts.eta_max = 1e10; 
opts.NG = 32 * ones(16, 1); % 分为16组, 每组32列
tic
[X_FLGSR, Y_FLGSR, C_FLGSR, Group, Rank] = FLGSR(data, Omega, Nway, opts);
time_FLGSR = toc;
[psnr_FLGSR, ssim_FLGSR, fsim_FLGSR] = quality(X, C_FLGSR);



