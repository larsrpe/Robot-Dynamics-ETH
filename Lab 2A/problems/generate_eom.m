% generate equations of motion
function eom = generate_eom(gen_cor, kin, dyn, jac)
% By calling:
%   eom = generate_eom(gen_cor, kin, dyn, jac)
% a struct 'eom' is returned that contains the matrices and vectors
% necessary to compute the equations of motion. These are additionally
% converted to matlab scripts.

%% Setup
phi = gen_cor.phi;      % Generalized coordinates (6x1 sym)
dphi = gen_cor.dphi;    % Generalized velocities (6x1 sym)

T_Ik = kin.T_Ik;        % Homogeneous transforms (6x1 cell)->(4x4 sym)
R_Ik = kin.R_Ik;        % Rotation matrices (6x1 cell)->(3x3 sym)

k_I_s = dyn.k_I_s;      % Inertia tensor of body k in frame k (6x1 cell)->(3x3 sym)
m = dyn.m;              % Mass of body k (6x1 cell)->(1x1 double)
I_g_acc = dyn.I_g_acc;  % Gravitational acceleration in inertial frame (3x1 double)
k_r_ks = dyn.k_r_ks;    % CoM location of body k in frame k (6x1 cell)->(3x1 double)

I_Jp_s = jac.I_Jp_s;    % CoM Positional Jacobian in frame I (6x1 cell)->(3x6 sym)
I_Jr = jac.I_Jr;        % CoM Rotational Jacobian in frame I (6x1 cell)->(3x6 sym)

eom.M = sym(zeros(6,6));
eom.g = sym(zeros(6,1));
eom.b = sym(zeros(6,1));
eom.hamiltonian = sym(zeros(1,1));

%% Compute mass matrix
fprintf('Computing mass matrix M... ');
% TODO: Implement M = ...;
M = sym(zeros(6,6));
for k = 1:6
    M = M + (m{k}*I_Jp_s{k}'*I_Jp_s{k} + (R_Ik{k}'*I_Jr{k})'*k_I_s{k}*(R_Ik{k}'*I_Jr{k}));
end

for i = 1:6
    for j = i:6
        M(i,j) = simplify(M(i,j));
        M(j,i) = M(i,j);
    end
end
fprintf('done!\n');


%% Compute gravity terms
fprintf('Computing gravity vector g... ');
% TODO: Implement g = ...;
g = sym(zeros(6,1));
for k = 1:6
    g = g - simplify(I_Jp_s{k}'*m{k}*I_g_acc);
end
fprintf('done!\n');


%% Compute nonlinear terms vector
fprintf('Computing coriolis and centrifugal vector b and simplifying... ');
% TODO: Implement b = ...;
b = sym(zeros(6,1));
for k = 1:6
    I_Jp_s_dot = simplify(dAdt(I_Jp_s{k},phi,dphi));
    I_Jr_dot = simplify(dAdt(I_Jr{k},phi,dphi));
    k_omega_ik = R_Ik{k}'*I_Jr{k}*dphi;
    b = b + simplify(I_Jp_s{k}'*m{k}*I_Jp_s_dot*dphi + (R_Ik{k}'*I_Jr{k})'*(k_I_s{k}*(R_Ik{k}'*I_Jr_dot)*dphi + cross(k_omega_ik,k_I_s{k}*k_omega_ik)));
end
b = simplify(b);
fprintf('done!\n');
    


%% Compute energy
fprintf('Computing total energy... '); 
% TODO: Implement hamiltonian, enPot, enKin = ...;
hamiltonian = sym(zeros(1,1));
enPot = sym(zeros(1,1));
enKin = sym(zeros(1,1));

for k=1:6
    I_r_s = [eye(3) zeros(3,1)]*T_Ik{k}*[k_r_ks{k};1];
    enPot = enPot - m{k}*I_g_acc'*I_r_s;
    
end

enKin = 0.5*dphi'*M*dphi;
hamiltonian = simplify(enKin + enPot);
fprintf('done!\n');


%% Generate matlab functions
fname = mfilename;
fpath = mfilename('fullpath');
dpath = strrep(fpath, fname, '');

fprintf('Generating eom scripts... ');
fprintf('M... ');
matlabFunction(M, 'vars', {phi}, 'file', strcat(dpath,'/M_fun'), 'Optimize', false);
fprintf('g... ');
matlabFunction(g, 'vars', {phi}, 'file', strcat(dpath,'/g_fun'), 'Optimize', false);
fprintf('b... ');
matlabFunction(b, 'vars', {phi, dphi}, 'file', strcat(dpath,'/b_fun'), 'Optimize', false);
fprintf('hamiltonian... ');
matlabFunction(hamiltonian, 'vars', {phi, dphi}, 'file', strcat(dpath,'/hamiltonian_fun'), 'Optimize', false);
fprintf('done!\n');


%% Store the expressions
eom.M = M;
eom.g = g;
eom.b = b;
eom.hamiltonian = hamiltonian;
eom.enPot = enPot;
eom.enKin = enKin;

end
