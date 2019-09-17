function XYZInterpolatedSetpoints = calcInterpolatedSetpoint(positionalMatrix, currTime)

frac = (currTime - positionalMatrix(4,1) )/( positionalMatrix(4,2) - positionalMatrix(4,1) );

XPos = (positionalMatrix(1,2) - positionalMatrix(1,1))*frac + positionalMatrix(1,1);
YPos = (positionalMatrix(2,2) - positionalMatrix(2,1))*frac + positionalMatrix(2,1);
ZPos = (positionalMatrix(3,2) - positionalMatrix(3,1))*frac + positionalMatrix(3,1);

XYZInterpolatedSetpoints(1) = XPos; %X Pos
XYZInterpolatedSetpoints(2) = YPos; %Y Pos
XYZInterpolatedSetpoints(3) = ZPos; %Z Pos
end

