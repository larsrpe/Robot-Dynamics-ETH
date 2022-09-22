function T01 = jointToTransform01(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 1 to frame 0. T_01
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T01 = zeros(4);
  q01 = [cos(q(1)/2);sin(q(1)/2)*[0;0;1]];
  r01_0 = 0.145*[0;0;1];
  R01 = quatToRotMat(q01);
  T01(1:3,1:3)=R01;
  T01(:,4)=[r01_0;1];
  
end