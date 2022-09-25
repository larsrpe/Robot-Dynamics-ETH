function J_R = jointToRotJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector orientation which maps joint
  % velocities to end-effector angular velocities in I frame.

  % Compute the rotational jacobian.
  J_R = zeros(3, 6);
  
  ex=[1;0;0];
  ey=[0;1;0];
  ez=[0;0;1];
  %rotation axis
  n01 = ez;
  n12 = ey;
  n23 = ey;
  n34 = ex;
  n45 = ey;
  n56 = ex;

  
  T_I0 = getTransformI0();
  T_I1 = T_I0*jointToTransform01(q);
  T_I2 = T_I1*jointToTransform12(q);
  T_I3 = T_I2*jointToTransform23(q);
  T_I4 = T_I3*jointToTransform34(q);
  T_I5 = T_I4*jointToTransform45(q);
  
  
  R_I0 = T_I0(1:3,1:3);
  R_I1 = T_I1(1:3,1:3);
  R_I2 = T_I2(1:3,1:3);
  R_I3 = T_I3(1:3,1:3);
  R_I4 = T_I4(1:3,1:3);
  R_I5 = T_I5(1:3,1:3);
  
  
  
  
  J_R(:,1) = R_I0*n01; 
  J_R(:,2) = R_I1*n12;
  J_R(:,3) = R_I2*n23;
  J_R(:,4) = R_I3*n34;
  J_R(:,5) = R_I4*n45;
  J_R(:,6) = R_I5*n56;
  
end
