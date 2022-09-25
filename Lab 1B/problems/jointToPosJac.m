function J_P = jointToPosJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector translation which maps joint
  % velocities to end-effector linear velocities in I frame.

  % Compute the translational jacobian.
  J_P = zeros(3, 6);
  
  ex=[1;0;0];
  ey=[0;1;0];
  ez=[0;0;1];
  %rotation axis
  n01 = ez;
  n12 = ey;
  n23 = ey;
  n34 = ex;
  n45 = ey;

  T_I0 = getTransformI0();
  T_I1 = T_I0*jointToTransform01(q);
  T_I2 = T_I1*jointToTransform12(q);
  T_I3 = T_I2*jointToTransform23(q);
  T_I4 = T_I3*jointToTransform34(q);
  T_I5 = T_I4*jointToTransform45(q);
  T_I6 = T_I5*jointToTransform56(q);
  
  
 
  R_I1 = T_I1(1:3,1:3);
  R_I2 = T_I2(1:3,1:3);
  R_I3 = T_I3(1:3,1:3);
  R_I4 = T_I4(1:3,1:3);
  R_I5 = T_I5(1:3,1:3);
  R_I6 = T_I6(1:3,1:3);
  
  I_ri1 = T_I1(1:3,4);
  I_ri2 = T_I2(1:3,4);
  I_ri3 = T_I3(1:3,4);
  I_ri4 = T_I4(1:3,4);
  I_ri5 = T_I5(1:3,4);
  I_ri6 = T_I6(1:3,4);
  
  
  I_r1e = I_ri6 - I_ri1;
  I_r2e = I_ri6 - I_ri2;
  I_r3e = I_ri6 - I_ri3;
  I_r4e = I_ri6 - I_ri4;
  I_r5e = I_ri6 - I_ri5;
  
  
  
  J_P(:,1) = cross(n01,I_r1e); 
  J_P(:,2) = cross(R_I1*n12,I_r2e); 
  J_P(:,3) = cross(R_I2*n23,I_r3e); 
  J_P(:,4) = cross(R_I3*n34,I_r4e); 
  J_P(:,5) = cross(R_I4*n45,I_r5e); 
  
  
end