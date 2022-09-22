function T56 = jointToTransform56(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 6 to frame 5. T_56
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T56 = zeros(4);
  q56 = [cos(q(6)/2);sin(q(6)/2)*[1;0;0]];
  r56_5 = 0.072*[1;0;0];
  R56 = quatToRotMat(q56);
  T56(1:3,1:3)=R56;
  T56(:,4)=[r56_5;1];
end
