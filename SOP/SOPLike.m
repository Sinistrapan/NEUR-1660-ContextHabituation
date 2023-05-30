function sopNLL = SOPLike (c, c2, cb)

sopTrialLogLike = zeros(1,18);

for i = 1:10
    for j = 1:10
        sopTrialLogLike(i) = log(c{2,i}(j,1));
    end
end

for i = 1:4
    for j = 1:10
        sopTrialLogLike(i+10) = log(c2{2,i}(j,1));
    end
end

for i = 1:4
    for j = 1:10
        sopTrialLogLike(i+14) = log(cb{2,i}(j,1));
    end
end

sopNLL = -1 * sum(sopTrialLogLike);