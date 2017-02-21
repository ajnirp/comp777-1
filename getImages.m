function [I_noise,I,ISeg,means,stds,prop] = getImages( nr )
%
% function [I_noise,I,ISeg,means,stds,prop] = getImages( nr )
%
% I_noise: noisy image
% I: image without noise
% ISeg: ground-truth segmentation) for validation
% means: means for foreground and background partition (do not use for homework)
% stds: standard deviations for foreground and background partitions (do not use for homework)
% prop: percentage of the overall area which is background
% nr: specifies the desired scenario (1-4)
  
means = [];
stds = [];
prop = 0.5;

switch nr 
 case 1
  [I_noise,I,ISeg] = getImages_meanSigmas( 100, 200, 25, 25 );
  means = [100 200];
  stds = [25 25];
 case 2
  [I_noise,I,ISeg] = getImages_meanSigmas( 100, 200, 5, 50 );
  means = [100 200];
  stds = [5 50];
 case 3
  [I_noise,I,ISeg] = getImages_meanSigmas_proportion( 100, 200, 25, 25, 0.05 );
  means = [100 200];
  stds = [25 25];
  prop = 0.05;
 case 4
  [I_noise,I,ISeg] = getImages_meanSigmas_proportion( 100, 200, 5, 50, 0.05 );
  means = [100 200];
  stds = [5 50];
  prop = 0.05;
 otherwise
  error('Unknown scenario');
end

function [IN,I,ISeg] = getImages_meanSigmas( mean1, mean2, std1, std2 )

I = zeros( 200, 200 );
IN = zeros( 200, 200 );
I(1:100,:) = mean1;
I(101:end,:) = mean2;

IN(1:100,:) = I(1:100,:) + std1*randn(100,200);
IN(101:end,:) = I(101:end,:) + std2*randn(100,200);

ISeg = I>mean1;

function [IN,I,ISeg] = getImages_meanSigmas_proportion( mean1, mean2, std1, std2, prop1 )

I = zeros( 200, 200 );
IN = zeros( 200, 200 );

to1 = round( 200*prop1 );

I(1:to1,:) = mean1;
I((to1+1):end,:) = mean2;

IN(1:to1,:) = I(1:to1,:) + std1*randn(to1,200);
IN((to1+1):end,:) = I((to1+1):end,:) + std2*randn(200-to1,200);

ISeg = I>mean1;








  