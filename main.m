% This script takes user input 
% (position vectors of point particles, masses), 
% and runs a loop of computing their positions over time
% and visualizes in them 3d space.

choice = input("Would you like to:\n1.randomly generate particles, or\n2. load them from a csv file?\nChoice: ");
if choice == 1
  amount = input("How many particles would you like to generate?\nAmount: ");
  pos = rand(amount, 3)*1e10;
  masses = rand(amount, 1)*1e24;
  vel = rand(amount, 3)*1e3;
  loadedVecs = [pos masses vel];
elseif choice == 2
  fprintf("load initial params from .csv file, with each row being [x, y, z, mass, v_x, v_y, v_z]\n");
  fileName = input("Enter Filename: ", 's');
  loadedVecs = csvread(fileName);
end

% change in seconds per timestep in simulation
dt = input("How many seconds per timestep?:\ns/timestep: ");

masses = loadedVecs(1:end, 4);
posMat = loadedVecs(1:end, 1:3);
% initial velocity and acceleration are zero for all particles
velocityMat = loadedVecs(1:end, 5:7);
accelMat = zeros(size(posMat));
t=0; % current time in seconds

% initializes graphics - sets blackground as black and changes grid and
% label color of 3d plot
fh = figure('NumberTitle', 'off', 'Name', 'N-Body Simulation');
dots = scatter3(posMat(1:end, 1),posMat(1:end, 2),posMat(1:end, 3), 'o', 'y');
ax = gca;
set(ax,'Color',[0 0 0],'GridColor',[0 1 1],'MinorGridColor',[0 1 1],...
  'XColor',[0 0 1],'YColor',[0 0 1],'ZColor',[0 0 1]);

% main loop - updates the state of the n-body system in increments of dt 
while true
  % updates pos, vel, accel of every particle in the system by computing
  % their gravitational forces on each other
  [posMat, velocityMat, accelMat] = updateSimGivenLast(posMat, velocityMat, accelMat, masses, dt); 
  % increases timestemp
  t = dt+t;
  % updates plot
  set(dots, 'XData', posMat(1:end, 1), 'YData', posMat(1:end, 2), 'ZData', posMat(1:end, 3)); 
  title("time passed: " + num2str(t) + "s");
  drawnow();
end


