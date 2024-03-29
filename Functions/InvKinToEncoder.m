function encoderOutput = InvKinToEncoder(XYZinput)

conversionConstant = 1;%Conversion constant from deg --> encoder

l1 = 135;
l2 = 175;
l3 = 169.28;

x = XYZinput(1);
y = XYZinput(2);
z = XYZinput(3);

theta1 = atan2d(y,x);
theta2 = atan2d((z-l1),((x^2+y^2)^(0.5))) + acosd((l2^2+x^2+y^2+((z-l1)^2)-l3^2)/ (2*l2*(sqrt(x^2+y^2+(z-l1)^2))));
theta3 = (acosd(((l2^2+l3^2)-(x^2+y^2+(z-l1)^2))/(-2*l2*l3)))-90;

thetaMatrix = [theta1 theta2 theta3];

encoderOutput = thetaMatrix*conversionConstant;
end

