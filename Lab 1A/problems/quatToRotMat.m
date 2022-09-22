function R = quatToRotMat(q)
  % Input: quaternion [w x y z]
  % Output: corresponding rotation matrix
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  R = zeros(3);
  e0 = q(1);
  e1 = q(2);
  e2 = q(3);
  e3 = q(4);
  R(1,1) = e0^2 + e1^2 - e2^2 -e3^2;
  R(1,2) = 2*e1*e2-2*e0*e3;
  R(1,3) = 2*e0*e2+2*e1*e3;
  R(2,1) = 2*e0*e3+2*e1*e2;
  R(2,2) = e0^2 - e1^2 + e2^2 -e3^2;
  R(2,3) = 2*e2*e3-2*e0*e1;
  R(3,1) = 2*e1*e3-2*e0*e2;
  R(3,2) = 2*e0*e1+2*e2*e3;
  R(3,3) = e0^2 - e1^2 - e2^2 +e3^2;
end
