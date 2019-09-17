addpath('Functions')

%Example input data for the robot
traj = [0   ,0    ,0    ,0  ; %X pos
        0   ,290  ,100  ,0  ; %Y pos
        160 ,80   ,300  ,200; %Z pos
        1   ,2    ,3    ,4] ; %Trajectory Time

[~,trajectories] = size(traj);

timeOffset = cputime;
currTime = 0;

%this is just used for printing
Xaccum = zeros(1,1);
Yaccum = zeros(1,1);
Zaccum = zeros(1,1);

for k = 1:trajectories
    
    %Helper1: contstruct pretty matrix of inital and final pos
    positionalMatrix = createMatrixOfPositions(traj,k);
    
    while currTime < traj(4,k)
        %this records current time
        currTime = cputime - timeOffset;
        
        %Helper2: contstruct 3x1 matrix of interploated set points to
        %perform perfect linar motion
        XYZInterpolated = calcInterpolatedSetpoint(positionalMatrix, currTime);
        
        %little arrays used for plotting the output
        %HERE IS WHERE YOU WRITE TO THE ROBOT INSTEAD
        %=================================================
        Xaccum = [Xaccum, XYZInterpolated(1)];
        Yaccum = [Yaccum, XYZInterpolated(2)];
        Zaccum = [Zaccum, XYZInterpolated(3)];
        %disp(currTime);
        %=================================================
        %ME ATTEMPTING TO WRITE THE ROBOT WITHOUT THE ROBOT
        currentSetXYZ = [XYZInterpolated(1),XYZInterpolated(2),XYZInterpolated(3)];
        encoderSet = InvKinToEncoder(currentSetXYZ);
        
        %DO PACKET THINGS HERE
        
    end
    
    disp("Next Traj");
end

scatter3(Xaccum,Yaccum,Zaccum);
disp("END");
