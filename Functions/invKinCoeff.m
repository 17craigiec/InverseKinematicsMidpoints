function matrixOfCoefficients = invKinCoeff(t0,t2,p0,pF,v0,vF,a0,aF)

syms A0 A1 A2 A3 A4 A5

eqn1 = A0 + A1*(t0) + A2*(t0*t0) + A3*(t0*t0*t0) + A4*(t0*t0*t0*t0) + A5*(t0*t0*t0*t0*t0)== p0;
eqn2 = A0 + A1*(t2) + A2*(t2*t2) + A3*(t2*t2*t2) + A4*(t2*t2*t2*t2) + A5*(t2*t2*t2*t2*t2)== pF;
eqn3 = A1 + 2*A2*(t0) + 3*A3*(t0*t0) + 4*A4*(t0*t0*t0) + 5*A5*(t0*t0*t0*t0)== v0;
eqn4 = A1 + 2*A2*(t2) + 3*A3*(t2*t2) + 4*A4*(t2*t2*t2) + 5*A5*(t2*t2*t2*t2)== vF;
eqn5 = 2*A2 + 6*A3*(t0) + 12*A4*(t0*t0) + 20*A5*(t0*t0*t0)== a0;
eqn6 = 2*A2 + 6*A3*(t2) + 12*A4*(t2*t2) + 20*A5*(t2*t2*t2)== aF;

sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [A0, A1, A2, A3, A4, A5]);

matrixOfCoefficients = [double(sol.A0) 
                        double(sol.A1) 
                        double(sol.A2) 
                        double(sol.A3)
                        double(sol.A4)
                        double(sol.A5)];
end