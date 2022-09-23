
ex=[1;0;0];
ey=[0;1;0];
ez=[0;0;1];

%linkages 
r01 = 0.145*ez;
r12 = 0.145*ez;
r23 = 0.270*ez;
r34 = 0.070*ez + 0.134*ex;
r45 = (0.374-0.134-0.072)*ex;
r56 = 0.072*ex;
r6e = zeros(3,1);

%rotation axis
nI0 = zeros(3,1);
n01 = ez;
n12 = ey;
n23 = ey;
n34 = ex;
n45 = ey;
n56 = ex;
n6e = zeros(3,1);

%clear helper vars
clear ex ey ez;