function q_AC = quatMult(q_AB,q_BC)
  % Input: two quaternions to be multiplied
  % Output: output of the multiplication
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  e0 = q_AB(1);
  e1 = q_AB(2);
  e2 = q_AB(3);
  e3 = q_AB(4);
  q_AC = [e0 -e1 -e2 -e3;e1 e0 -e3 e2; e2 e3 e0 -e1; e3 -e2 e1 e0]*q_BC;
end

