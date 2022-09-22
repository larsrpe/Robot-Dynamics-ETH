function T23 = jointToTransform23(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 3 to frame 2. T_23
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T23 = zeros(4);
  q23 = [cos(q(3)/2);sin(q(3)/2)*[0;1;0]];
  r23_2 = 0.270*[0;0;1];
  R23 = quatToRotMat(q23);
  T23(1:3,1:3)=R23;
  T23(:,4)=[r23_2;1];
end
