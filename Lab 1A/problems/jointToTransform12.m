function T12 = jointToTransform12(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 2 to frame 1. T_12
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T12 = zeros(4);
  q12 = [cos(q(2)/2);sin(q(2)/2)*[0;1;0]];
  r12_1 = 0.145*[0;0;1];
  R12 = quatToRotMat(q12);
  T12(1:3,1:3)=R12;
  T12(:,4)=[r12_1;1];
end