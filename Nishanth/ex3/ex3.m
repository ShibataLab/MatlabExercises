%% Shibata Lab Workshops, 2015/5/2

% Machine Learning 101 Workshop
% ex3: computeCost

% In this exercise you will implement the cost function J()
% for gradient descent algorithm. Write your code in the
% file computeCost.m where it is indicated

%% Initialization
clear; close all; clc

% Loading data (ex2)
data = load('ex3data.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

% Add column of ones to X
X = [ones(m,1) data(:,1)];

% Initialize hypothesis parameters theta to 0
theta = zeros(2,1);

% Instructions: Write your code for the cost function in 
% computeCost.m file

% Explanation: X data, y data and theta values are passed to 
% computeCost as parameters and cost is obtained as output
cost = computeCost(X,y,theta);

% Printing result
% The result should be 32.07
fprintf('Cost estimated for theta values (0,0): \n');
fprintf('%f\n',cost);

