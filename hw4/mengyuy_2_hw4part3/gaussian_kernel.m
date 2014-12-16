function kernel = gaussian_kernel(x, z)
% returns a gaussian kernel matrix with gamma == 1/2 of vector x and vector z
% x and z must be in the same dimension
    % YOUR CODE HERE
    kernel = exp(-sum(0.5 * (x-z).^2));
    