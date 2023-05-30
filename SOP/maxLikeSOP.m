function [output]=maxLikeSOP(input)
[ML_params, NLL]= fmincon(@callSOPLike, input.startPoint,[],[],[],[], input.LB, input.UB);
output = struct;
output.params = ML_params;
output.logLikelihood = -NLL;
    
    function [sopNLL]=callSOPLike(params)
        @callSOPLike;
        [sopNLL] = SOPLike(params(1), params(2), params(3), params(4), params(5), params(6), params(7), params(8), params(9), params(10),input.Vcsus,input.Vcs2us);
    end
end