function Ypredict = TrainHeldOut(Xtrain, Ytrain, testInstanceLabel)

%    ytest = Ytrain(testInstanceLabel,:);

     xtrain = Xtrain(testInstanceLabel == 0,:);
     ytrain = Ytrain(testInstanceLabel == 0, :);
     xtest = Xtrain(testInstanceLabel == 1,:);
     model = nb_train(xtrain, ytrain);
     Ypredict = nb_test(model, xtest);
     
     
%      model = nb_train(Xtrain(~testInstanceLabel, :), Ytrain(~testInstanceLabel));
%      Ypredict = nb_test(model, Xtrain(testInstanceLabel, :));
%      accuracy = mean(Ypredict == ytest)
end