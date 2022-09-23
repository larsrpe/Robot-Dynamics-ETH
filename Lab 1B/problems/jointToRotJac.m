function J_R = jointToRotJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector orientation which maps joint
  % velocities to end-effector angular velocities in I frame.

  % Compute the rotational jacobian.
  J_R = zeros(3, 6);
  
  %get params for robot
  %rotation axis
  n01 = evalin('base','n01');
  n12 = evalin('base','n12');
  n23 = evalin('base','n23');
  n34 = evalin('base','n34');
  n45 = evalin('base','n45');
  n56 = evalin('base','n56');
 

  
  T_I0 = getTransformI0();
  T_I1 = T_I0*jointToTransform01(q);
  T_I2 = T_I1*jointToTransform12(q);
  T_I3 = T_I2*jointToTransform23(q);
  T_I4 = T_I3*jointToTransform34(q);
  T_I5 = T_I4*jointToTransform45(q);
  T_I6 = T_I5*jointToTransform56(q);
  
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
