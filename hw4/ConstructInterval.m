function [Accuracy, lowerInterval, upperInterval] = ConstructInterval(Ypredict, Ytest, confLevel)
    
%     corrects = Ypredict == Ytest;
%     Accuracy = 100*mean(corrects);  
%     fprintf('Accuracy: %.3f%%\n', Accuracy); 
%     
%     if confLevel == 99%
%         zn = 2.576;
%     end
%     if confLevel == 95%
%         zn = 1.960;
%     end
%     lowerInterval = Accuracy - zn*sqrt(Accuracy*(1-Accuracy)/n);
%     upperInterval = Accuracy + zn*sqrt(Accuracy*(1-Accuracy)/n);
    numTest = length(Ytest);
    Accuracy = sum(Ypredict == Ytest) / numTest;
    zn = norminv(confLevel + (1 - confLevel)/2);
    sqRoot = sqrt(Accuracy * (1-Accuracy) / numTest);
    lowerInterval = Accuracy - zn*sqRoot;
    upperInterval = Accuracy + zn*sqRoot;
    
end
    
    
