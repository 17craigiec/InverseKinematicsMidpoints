function setpoint = interpolatePosUsingFunction( coefficientMatrix, t )

    A0 = coefficientMatrix(1);
    A1 = coefficientMatrix(2);
    A2 = coefficientMatrix(3);
    A3 = coefficientMatrix(4);
    A4 = coefficientMatrix(5);
    A5 = coefficientMatrix(6);
    
    setpoint = A0 + A1*t + A2*t^2 + A3*t^3 + A4*t^4 + A5*t^5;

end