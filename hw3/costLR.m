function [cost, grad, hess] = costLR(X, y, theta, lambda)
% costLR  Logistic Regression cost function.
%
%   X      - m x (n+1) design matrix of m examples
%   y      - m x 1 labels
%   theta  - current logistic regression parameters.
%   lambda - regularization term.
%
%   cost - cost at theta
%   grad - gradient at theta. i.e. [dJ/dx1, ..., dJ/dxn]' (n x 1 vector)
%   hess - hessian (symmetric matrix of second partial derivatives) at
%          theta, i.e.  (n x n matrix)
%             [d2J/dx1*dx1, d2J/dx1*dx2, ..., d2J/dx1*dxn;
%              d2J/dx2*dx1, d2J/dx2*dx2, ..., d2J/dx2*dxn;
%                 .               .                  .
%                 .               .                  .
%              d2J/dxn*dx1, d2J/dxn*dx2, ..., d2J/dxn*dxn]
%
%  When theta is a scalar, cost is just J(X,y,theta), grad is just
%   dJ(X,y,theta)/dtheta and hess is just d2J(X,y,theta)/dtheta^2.
%
%  Example usage:
%    cost = costLR(randn(100, 2), rand(100, 1) < 0.5, randn(2, 1));
%    [cost, grad] = costLR([1, 2; 1, 4], [0; 1], [0.1; 0.5])
%    [cost, grad, hess] = costLR(A, B, C); % hessian is optional
    
    % Write your solution below. If you choose to implement Newton's
    % method, please also compute hess. If you choose to just use gradient
    % descent, then the hessian is not required (you can just leave it
    % blank).
    % Our solution is approx 6 lines.
     cost = 0;
     grad = zeros(size(theta));
    %% BEGIN SOLUTION    
    cost =lambda/2*sum(theta.^2)-sum( y.*log(sigmoid(X*theta)) + (1-y).*log(1-sigmoid(X*theta)) ); 
    grad = lambda*theta-(X'*(y-sigmoid(X*theta)));
         
%     Approach2: use loop    
%     sizeX = size(X);
%     rowNum = sizeX(1);
%     columnNum = sizeX(2);
%     costSum = 0;
%     regTerm = 0;
%     gradSum = zeros(columnNum, 1);
%     for j=1:columnNum
%         regTerm = regTerm + (theta(j,1)).^2;
%     end    
%     for i=1:rowNum
%         sigmoidInput = X(i,:) * theta(:,1);
%         predictValue = sigmoid(sigmoidInput);
%         costSum = costSum + y(i,1)* log(predictValue) + (1-y(i,1))*log(1-predictValue);
%         gradSum = gradSum+((y(i,1) - predictValue) * X(i,:))';
%     end
%     cost = lambda/2*regTerm - costSum;
%     grad=lambda*theta - gradSum;
        
    %% END SOLUTION
end

function y = logsumexp(x)
% LOGSUMEXP More numerically stable version of y = log(sum(exp(x), 2));
    b = max(x,[],2);
    y = log(sum(exp(x-repmat(b,[1, size(x,2)])),2))+b;
end

function y = sigmoid(x)
% SIGMOID  Computes sigmoid function, y = e^x/(1+e^x) = 1/(1+e^-x).
    y = 1./(1. + exp(-x));
end