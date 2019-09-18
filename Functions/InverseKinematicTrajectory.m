function setPointsXYZ = InverseKinematicTrajectory(positionalMatrix, currTime)
    
    Xv0 = 0;
    XvF = 0;
    Yv0 = 0;
    YvF = 0;
    Zv0 = 0;
    ZvF = 0;
    
    Xa0 = 0;
    XaF = 0;
    Ya0 = 0;
    YaF = 0;
    Za0 = 0;
    ZaF = 0;
    
    Xp0 = positionalMatrix(1,1);
    XpF = positionalMatrix(1,2);
    Yp0 = positionalMatrix(2,1);
    YpF = positionalMatrix(2,2);
    Zp0 = positionalMatrix(3,1);
    ZpF = positionalMatrix(3,2);
    
    t0 = positionalMatrix(4,1);
    t2 = positionalMatrix(4,2);

    XmatrixOfCoefficients = invKinCoeff(t0,t2,Xp0,XpF,Xv0,XvF,Xa0,XaF);
    YmatrixOfCoefficients = invKinCoeff(t0,t2,Yp0,YpF,Yv0,YvF,Ya0,YaF);
    ZmatrixOfCoefficients = invKinCoeff(t0,t2,Zp0,ZpF,Zv0,ZvF,Za0,ZaF);
    
    setPointsXYZ(1) = interpolatePosUsingFunction( XmatrixOfCoefficients, currTime );
    setPointsXYZ(2) = interpolatePosUsingFunction( YmatrixOfCoefficients, currTime );
    setPointsXYZ(3) = interpolatePosUsingFunction( ZmatrixOfCoefficients, currTime );
    
end

