# Solving simple ordinary differential equation (ODE)

## Motivation 
An ordinary differential equation (ODE) is a differential equation that contains functions of one variable along with their derivatives. Such kind of equations can be hard to solve hence why the use of numerical methods to solve them can be useful.
The code used in this repository is a general algorithm to allow an equation of the following form: 
>   u'(x)  \- *epsilon* u''(x)= f(x)      

The number **epsilon* is known as the *Peclet Number and is relevant in the study of transport phenomena in a continuum. 

## How the code works 
The idea of the code is to discretize the interval [0,1] into n+1 points, with x0 = 0 and xn = 1, 
and then find the solution u(x) by extrapolating its value at each pointssuch that the vectors U = [U*0*,U*1*,..,U*n*]=[u(x0),...,u(xn)] and F = [F*0*,F*1*,..,F*n*]=[f(x0),...,f(xn)]can be defined

The basis of the finite difference method is that the first and second derivative can be approximated as:
> u'(x*i*) = (U*i+1* - U*i-1*)/2h 
> u''(x*i*) = (U*i+1* - 2U*i* + U*i-1*)/(h^2)
with h = 1/n

Therefore solving the ODE can be done by evaluating u' and u'' in xi, and replacing by the discretization defined above.
Since U*0* = u(0) = alpha and U*n*= u(1) = beta, therefore those values are known and therefore only *n-1* equations for i in [1,2,...n-1]
Those equations will give rise to a system, and as such solving the ODE is similar solving a matrix equation of the form 
> AU = F

## Information to run the code
The code should be run on matlab. 
- There is only one file containing at the bottom the general function solveODE to solve the equation given alpa, beta, epsilon and f as parameters. 
- In the file the users can input the main parameters of the ODE and plot the numerical solution and compare it to the analytical one.
- The users can also play with the parameters to see how they affect the accuracy of the numerical approximation. For example, as **epsilon** becomes small then the numerical approximation becomes less accurate.

## Author 
Carole Baslé
