function T34 = jointToTransform34(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 4 to frame 3. T_34
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T34 = zeros(4);
  q34 = [cos(q(4)/2);sin(q(4)/2)*[1;0;0]];
  r34_3 = [0.134;0;0.070];
  R34 = quatToRotMat(q34);
  T34(1:3,1:3)=R34;
  T34(:,4)=[r34_3;1];
end

