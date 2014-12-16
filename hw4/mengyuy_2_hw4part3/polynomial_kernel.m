function kernel = polynomial_kernel( x, z )
% returns a polynomial kernel matrix with d = 2
    % YOUR CODE HERE
   kernel = (x'*z+1).^2;
   