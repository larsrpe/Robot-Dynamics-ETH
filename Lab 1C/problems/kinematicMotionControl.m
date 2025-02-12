function [ Dq ] = kinematicMotionControl(q, r_des, v_des)
% Inputs:
%  q          : current configuration of the robot
% r_des       : desired end effector position
% v_des       : desired end effector velocity
% Output: joint-space velocity command of the robot.

% Compute the updated joint velocities. This would be used for a velocity controllable robot
% TODO:
kp = 5;
lambda = 0.1;
Dq = 0.1*ones(6,1);
pinv_J_p = pseudoInverseMat(jointToPosJac(q),lambda);
dr = r_des - jointToPosition(q);
Dq = pinv_J_p*(v_des + kp * dr);
end
