%%Solving a ordinary differential equation of order 2 of the form : 
% u'(x) = epsilon * u''(x) + f(x) , x in [0,1]
% u(0) = alpha  and u(1) = beta 


%% Input parameters of the problem
% input parameters can be changed in order to see the influence  
alpha = 1;
beta = 3;
n = 16;
eps = 0.01;
f = ones(max(n),1);

%% Approximation of the solution 
U = solveODE(alpha,beta,n,f,eps);

% h : step of discretization, xn : points of the axis
h = 1/n;
xn = 0:h:1;
%% Exact analytical solution
u = @(x) alpha + x +(beta - alpha - 1)*((exp(x/eps)-1)/(exp(1/eps)-1));
uN = u(xn);
%% Ploting the results and the analytical solution 
figure 
plot(xn,U,'-b',xn,uN,'-r')
xlabel('x')
ylabel('u(x)')
title('h = 1/'+ string(n) + ' and epsilon = ' + string(eps))
legend('U - computed solution', 'u(x) analytical')





%Function the solve the matrix equation of the problem by finite differences
function U = solveODE(alpha,beta,N,f,epsilon)
h = 1/N;
F = f(2:N);
F(1) = F(1) + alpha*epsilon/(h^2) + alpha/(2*h);
F(N-1) = F(N-1) + beta*epsilon/(h^2) - beta/(2*h);

A = (2*epsilon/(h^2))*eye(N-1);
for i = 1:N-2
    A(i,i+1)= 1/(2*h) - epsilon/(h^2);
    A(i+1,i)= -1/(2*h) - epsilon/(h^2);
end
U = A \ F;
U = [alpha,U',beta];
end






