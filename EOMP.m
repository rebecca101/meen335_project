function XDOT = EOMP(Time, x)

%%% Initialize xdot %%%

    XDOT = zeros(length(x),1);

%%% State Variables %%%

    Position     = x(1); 
    Velocity     = x(2);
    Mass_of_fuel = x(3);
  
%%% Inputs and Constants %%%

    T   = 100000000;    % Thrust, N
    mr  = 997903.214;  % Mass of rocket, kg
    %mf  = 997903.214;  % Mass of fuel, kg
    G   = 6.67*10^(-11); % Gravitiational constant, N-m^2/kg^2
    me  = 5.972*10^24; % Mass of Earth, kg
    Cd  = 0.04;        % Drag coefficient (Streamlined body), Dimensionless
    rho = 1.2041;      % Density of air, kg/m^3
    A   = 10;          % Cross sectional reference aera, m
    Vef = 2682.24;     % Exit Velocity of fuel, m/s
    
    

%%% State Derivatives %%%

    XDOT(1) = Velocity;
    XDOT(2) = T/(mr + Mass_of_fuel) - G*me*(mr + Mass_of_fuel)/(Position^2) - Cd*rho*Velocity^2*A/(2*(mr + Mass_of_fuel));
    XDOT(3) = T/Vef;

