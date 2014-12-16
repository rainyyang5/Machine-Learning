clear all; addpath('image');addpath('image/inst');
load('data.mat'); % load image paths and filter bank  


%--------------------------------------
%   YOUR CODE STARTS HERE
%--------------------------------------
k = 200;
data = zeros(1, 99);

%For each image in the dataset
for i = 1:length(imagePaths)
    
    %get the image path
    img_path = imagePaths{i};
    
    %read the image
    I = imread(img_path);
    
    %extract feature points
    featurePoints = extractFilterResponses(I, filterBank);
    
    
    %TODO: store just a random subsample of the feature points
    sizePoint = size(featurePoints);
    pointNum = sizePoint(1);
    
    randP = randperm(pointNum)';
    data = [data;featurePoints((mod(randP,100) == 1),:)];
    
    
end


%TODO: apply K-Means to the set of all the stored feature vectors
[dictionary, ~] = k_means(data, k);
%TODO: Save dictionary
save('dictionary.mat','dictionary');



%--------------------------------------
%   YOUR CODE ENDS HERE
%--------------------------------------


