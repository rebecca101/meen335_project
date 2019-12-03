%%% Setup %%%
  
##    clc
##    clf 
##    clear all 

%%% Define Initial Conditions %%%
    
    Position(1)     = .0001;  % Positoin @ time = 0      
    Velocity(1)     = .0001;  % Velocity @ time = 0 
    MFR(1)          = 1;  % Mass flow rate @ time = 0
    
%%% Time Specifics %%%
    
    Time_Zero      = 0;                                   % Initial time
    Time_Increment = .1;                                 % Step size
    Time_Final     = 10;                                 % Final time
    Time           = Time_Zero:Time_Increment:Time_Final; % Time span

%%% State Vector initialization %%%
    
    Initial_Conditions = [Position(1) Velocity(1) MFR(1)];

%%% ODE45 METHOD %%%
    
    [Time_Out Y_Out] = ode45('EOMP', [Time_Zero Time_Final], Initial_Conditions);

%%% Position, Velocity & Acceleration Output %%%
    
    Time         = Time_Out;
    Position     = Y_Out(:,1);    
    Velocity     = Y_Out(:,2);
    MFR          = Y_Out(:,3);

%%% Plot Data %%%
    
    hold on 
    subplot(3,1,1)
    plot(Time, Position, 'r')
    title("Position vs. Time")
    xlabel("Time (Seconds)")
    ylabel("Position (Meters)")
    
    subplot(3,1,2)
    plot(Time, Velocity, 'b')
    title("Velocity vs. Time")
    xlabel("Time (Seconds)")
    ylabel("Velocity (Meters/Second)")
    
    subplot(3,1,3)
    plot(Time, MFR, 'k')
    title("Mass Flow Rate vs. Time")
    xlabel("Time (Seconds)")
    ylabel("Mass Flow Rate (Kilograms/Second)")
    