function [Pred_nb] = nb_test(model, Xtest)

sizeXtest = size(Xtest);
numTest = sizeXtest(1);
numWord = sizeXtest(2);
Pred_nb(1:numTest,1) = -1;
prior0 = model(3,1);
prior1 = model(3,2);

for i=1:numTest
    Label0=0;
    Label1=0;
    for j=1:numWord
        Label0 = Label0 + Xtest(i,j).*log(model(1,j));
        Label1 = Label1 + Xtest(i,j).*log(model(2,j));
    end
    Label0 = Label0+log(prior0);
    Label1 = Label1+log(prior1);
    
    if Label0 >= Label1
        Pred_nb(i)=0;
    else
        Pred_nb(i)=1;
    end
end

end