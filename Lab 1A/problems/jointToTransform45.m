function T45 = jointToTransform45(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 5 to frame 4. T_45
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T45 = zeros(4);
  q45 = [cos(q(5)/2);sin(q(5)/2)*[0;1;0]];
  r45_4 = (0.374-0.134-0.072)*[1;0;0];
  R45 = quatToRotMat(q45);
  T45(1:3,1:3)=R45;
  T45(:,4)=[r45_4;1];
  
end

