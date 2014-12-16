function y_pred = predictLR(X, theta)
% PREDICTLR  Using fitted parameters, predict labels for data, X.
%           X      - m x n design matrix of m observations with n features.
%           theta  - (n+1) x 1 trained logistic regression parameters
%                    vector.
%
%           y_pred - predicted labels using trained model.

    [m, n] = size(X);
    
    y_pred = zeros(m,1);
    % Predict the labels for X. Our solution is ~2 lines.
    
    %% BEGIN SOLUTION
    X = [ones(m,1) X];
    y_pred = (X*theta > 0);
    %% END SOLUTION
end