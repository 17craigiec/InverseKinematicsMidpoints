
function inversePositions = createMatrixOfPositions(traj,k)

inversePositions = zeros(4,2);

%SpecialCase
if k == 1
    %X
    inversePositions(1,1) = 0;
    inversePositions(1,2) = traj(1,k);
    %Y
    inversePositions(2,1) = 0;
    inversePositions(2,2) = traj(2,k);
    %Z
    inversePositions(3,1) = 0;
    inversePositions(3,2) = traj(3,k);
    %TIME
    inversePositions(4,1) = 0;
    inversePositions(4,2) = traj(4,k);
else
    %X
    inversePositions(1,1) = traj(1,k-1);
    inversePositions(1,2) = traj(1,k);
    %Y
    inversePositions(2,1) = traj(2,k-1);
    inversePositions(2,2) = traj(2,k);
    %Z
    inversePositions(3,1) = traj(3,k-1);
    inversePositions(3,2) = traj(3,k);
    %TIME
    inversePositions(4,1) = traj(4,k-1);
    inversePositions(4,2) = traj(4,k);
end

end

