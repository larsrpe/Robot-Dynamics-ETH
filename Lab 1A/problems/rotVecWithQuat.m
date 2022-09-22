function B_r = rotVecWithQuat(q_BA,A_r)
  % Input: the orientation quaternion and the coordinate of the vector to be mapped
  % Output: the coordinates of the vector in the target frame
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  q_A_r = [0;A_r];
  q_AB = [q_BA(1);-q_BA(2:4)];
  q_B_r = quatMult(quatMult(q_BA,q_A_r),q_AB);
  B_r = q_B_r(2:4);
end
