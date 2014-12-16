function [model] = nb_train(Xtrain, Ytrain)

sizeXtrain = size(Xtrain);
numDoc = sizeXtrain(1);
numWord = sizeXtrain(2);
numClass0 = 0;
numClass1 = 0;
model(1,1:numWord) = 0;
model(2,1:numWord) = 0;

for i= 1:numDoc
	if Ytrain(i) == 0
		numClass0 = numClass0+1;
		for j = 1:numWord
			model(1,j) = model(1,j) + Xtrain(i,j);
		end
	else 
		numClass1 = numClass1+1;
		for j = 1:numWord
			model(2,j) = model(2,j) + Xtrain(i,j);
		end
	end
end

model(1,:) = (model(1,:)+1)./(sum(model(1,:))+numWord);
model(2,:) = (model(2,:)+1)./(sum(model(2,:))+numWord);
model(3,1)=(numClass0+1)./(numClass0+numClass1+2);
model(3,2)=(numClass0+1)./(numClass0+numClass1+2);
end