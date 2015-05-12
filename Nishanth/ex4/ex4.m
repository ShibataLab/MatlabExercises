%% Shibata Lab Workshops, 2015/5/2

% Machine Learning 101 Workshop
% ex4: gradientDescent

% In this exercise you will implement gradient descent algorithm.
% For this first edit computeCost.m, you can use code from ex3.
% Then edit the code in gradientDescent.m where it is indicated.

%% Initialization
clear; close all; clc

% Loading data 
data = load('ex4data.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

% Add column of ones to X
X = [ones(m,1) data(:,1)];

% Initialize hypothesis parameters theta to 0
theta = zeros(2,1);

% Set the number of iterations
iterations = 1500;

% Set the learning rate
alpha = 0.01;

% Instructions: Write your code for the cost function in 
% computeCost.m file from ex3 and for gradient descent in
% gradientDescent.m

% Explanation: X, y, theta, alpha, iterations are passed as 
% arguments to gradientDescent and the final theta values are
% obtained.

theta = gradientDescent(X, y, theta, alpha, iterations);

% Plotting the final obtained theta values
hold on;
plot(X(:,2),y,'rx','MarkerSize',10);
plot(X(:,2), X*theta, 'b-');
legend('Training data', 'Linear regression');
hold off;

% Predicting the values for population sizes of 35,000 and 70,000
testX1 = [1 3.5];
testy1 = testX1*theta;
fprintf('For population = 35,000, we predict a profit of %f\n',testy1*10000);

testX2 = [1 7];
testy2 = testX2*theta;
fprintf('For population = 70,000, we predict a profit of %f\n',testy2*10000);

% Visualizing J() function
fprintf('Visualizing J(theta_0, theta_1) \n');

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% Initialize J_vals to a matrix of 0
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals 
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

J_vals = J_vals';

% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals);
xlabel('\theta_0'); 
ylabel('\theta_1');

% Contour plot
figure;

% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))

xlabel('\theta_0'); 
ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
