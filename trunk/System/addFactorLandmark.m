function System=addFactorLandmark(factorR,Config,System)

% Config=addPose(factorR,Config)
% The script adds a new landmark factor to the current System
% Author: Viorela Ila

Sz=diag([1/factorR.data(6);1/factorR.data(8)]); % only diag cov.
R=chol(inv(Sz)); %S^(-1/2)

% The 2 poses linked by the constraint
s1=factorR.data(2); % robot
s2=factorR.data(1); % landmark
z=factorR.data(3:4)';

ndx1=[Config.PoseDim*Config.id2config((s1+1),1)+Config.LandDim*Config.id2config((s1+1),2)]+[1:Config.PoseDim];
ndx2=[Config.PoseDim*Config.id2config((s2+1),1)+Config.PoseDim+Config.LandDim*Config.id2config((s2+1),2)-Config.LandDim]+[1:Config.LandDim];

P1=Config.vector(ndx1); % The estimation of the two poses
pt=Config.vector(ndx2);


switch factorR.obsType
    case 'rb'
        h=AbsolutePoint2RBObs(P1,pt); % Expectation
        [H1 H2]=AbsolutePoint2RBObsJacobian(P1,pt);
        d=z-h;
        d(end)=pi2pi(d(end));
    case 'dxdy'
        h=AbsolutePoint2RelativePoint(P1,pt); % Expectation
        [H1 H2]=AbsoluteRelativePointJacobian(P1,pt);
        d=z-h;
    otherwise
        error('unknown observation type');
end



% Update System

System.ndx=System.ndx(end)+1:System.ndx(end)+Config.LandDim;
System.A(System.ndx,ndx1)=sparse2(R*H1); % Jacobian matrix
System.A(System.ndx,ndx2)=sparse2(R*H2);

System.b(System.ndx)=R*d; % Independent term





