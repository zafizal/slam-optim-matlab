function [Config]=composePosesOdometry(Data,Config)

% [Config, System, Graph]=composePosesOdmetryData, Config)
% Author: Viorela Ila
    
ndx=1:Config.PoseDim;

Config.vector(ndx,:)=[Config.p0,ones(Config.PoseDim,1)]; %init config
Config.id2config=zeros(Data.nVert,2); % variable id to position in the config vector converter
Config.id2config(Data.ed(1,2)+1,:)=[Config.nPoses,Config.nLands];
idX=Data.vert(1,1);
ind=1;
while ind<Data.nEd
    factorR.data=Data.ed(ind,:);
    factorR=getDofRepresentation(factorR,Data.obsType);
    factorR=processFactor(factorR,idX);
    Config=addVariableConfig(factorR,Config,idX);
    idX=[idX;factorR.data(1)];
    ind=ind+1;
end
