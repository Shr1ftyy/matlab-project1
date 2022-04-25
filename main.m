% This script takes user input 
% (position vectors of point particles, masses), 
% and runs a loop of computing the
% ir positions over time
% and visualizes in them 3d space.

fprintf("load initial params from .csv file, with each row being [x, y, z, mass, v_x, v_y, v_z]\n");
fileName = input("Enter Filename: ", 's');
loadedVecs = csvread(fileName);


% loadedVecs = [1 1 1 10000000; 2 2 2 20000000 ; 4 5 6 20000000];
masses = loadedVecs(1:end, 4);
posMat = loadedVecs(1:end, 1:3);
% initial velocity and acceleration are zero for all particles
velocityMat = loadedVecs(1:end, 5:7);
accelMat = zeros(size(posMat));
t=0; % latest time in seconds
dt=3.154e7; % change in t per timestep

fh = figure('NumberTitle', 'off', 'Name', 'N-Body Simulation');
dots = scatter3(posMat(1:end, 1),posMat(1:end, 2),posMat(1:end, 3), 'o', 'y');
% fh.set("Color", 'k');
ax = gca;
% ax.set('Color',[0 0 0]);
% axes1 = axes('',fh);
set(ax,'Color',[0 0 0],'GridColor',[0 1 1],'MinorGridColor',[0 1 1],...
  'XColor',[0 0 1],'YColor',[0 0 1],'ZColor',[0 0 1]);
% trails = line(posMat(1:end, 1),posMat(1:end, 2),posMat(1:end, 3));


while true
  [posMat, velocityMat, accelMat] = updateSimGivenLast(posMat, velocityMat, accelMat, masses, dt); 
  t = dt+t;
%   disp(posMat);
  set(dots, 'XData', posMat(1:end, 1), 'YData', posMat(1:end, 2), 'ZData', posMat(1:end, 3)); 
  title("time passed: " + num2str(t) + "s");
  drawnow();
end


