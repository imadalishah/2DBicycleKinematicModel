clear; close all; clc
%% Model Parameters
L = 3; %wheel base
delta_T=0.1;
timeSpan=5.25;
initialStates = [0 0 pi/4]; % [x y theta]
inputs = [2 pi/3];  % [x delta]	(+)ive PI turns Left & (-)ive turns Right
v=inputs(1);
delta=inputs(2);
xk=initialStates(1); yk=initialStates(2); theta=initialStates(3);
 figure	p = plot(xk,yk,'O','MarkerFaceColor','red');
for l=1:2   % For Changing Direction
    for i=1:(timeSpan/0.1) 
        x_next=xk+(v*cos(theta))*delta_T;		%% Calc next state
        y_next=yk+(v*sin(theta))*delta_T;
        theta_next=theta+((v*tan(delta))/L)*delta_T;
 
        xk=x_next;	 yk=y_next;	theta=theta_next; %% Save state        

        hold on	plot(xk,yk,'.');				%% Plot current state
        p.XData = xk;		p.YData = yk;		drawnow
        axis([-5 5 -4 4]);	 	pause(0.01);
    end
    delta=-1*delta; 	% Change Direction
end
