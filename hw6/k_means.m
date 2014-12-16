
function [clusterCenters, clusterBelonging] = k_means(data, k, startPoints)

%--------------------------------------
%   YOUR CODE HERE
%--------------------------------------
  sizeData = size(data);
  pointNum = sizeData(1);
%  featureNum = sizeData(2);
  clusterBelonging = zeros(pointNum, 1);
  Belonging2 = zeros(pointNum, 1);
  
  
  
  if nargin < 3
    %startPnt = rank (k, featureNum); 
    randP = randperm(pointNum)';
    clusterCenters = data(randP(1:k,1),:);
  else
    clusterCenters = startPoints;
  end
  
  
  while true  
    distMatrix = zeros(pointNum, k);
    for i = 1:k
      centers = repmat(clusterCenters(i,:), pointNum, 1);
      distMatrix(:,i) = sqrt(sum(((data-centers).^2), 2));
    end
      
    [~, Belonging2] = min(distMatrix, [], 2);
    if clusterBelonging == Belonging2 
      break;
    else
      clusterBelonging = Belonging2;
    end
   
    for i = 1:k
      points = find(clusterBelonging == i);
      if points
        clusterCenters(i,:) = mean(data((clusterBelonging==i),:),1);
      end
    end 
  end
end
   



        
    
