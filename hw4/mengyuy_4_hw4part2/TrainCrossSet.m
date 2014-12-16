function Ypredict = TrainCrossSet(Xtrain, Ytrain, crossSetLabel)
    Ypredict = crossSetLabel;
    fold = max(crossSetLabel);
    
    for i = 1:fold
            label = (crossSetLabel == i);
            predict = TrainHeldOut(Xtrain, Ytrain, label);
            Ypredict(Ypredict==i)=predict;
            %model = nb_train(Xtrain(trainLabel,:),Ytrain(trainLabel));
            %Ypredict = nb_test(model, Xtrain(testLabel,:))
    end
end