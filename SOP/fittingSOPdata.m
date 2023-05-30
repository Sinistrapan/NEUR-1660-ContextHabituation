input = struct;
input.startPoint = [.05,.05,.05,.05,.05,.05,.05,.05,.05,.05];
input.LB = [0,0,0,0,0,0,0,0,0,0];
input.UB = [1,1,1,1,1,1,1,1,1,1];
input.Vcsus = 0;
input.Vcs2us = 0;

[output]=maxLikeSOP(input);
