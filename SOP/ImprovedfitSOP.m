%% Parameters
p1_cs = 0.3608; %P(I --> A1) correlated w/ stim. intensity
p1_us = 0.4156;
d1 = 0.0891; %P(A1 --> A2) Decay Parameter
d2 = 0.0996; %P(A2 --> I) Decay Parameter
r1 = 0.8780; %Weight of pa1_cs (r1 > r2)
r2 = 0.7042; %Weight of pa2_cs
Ln = 0.0516; %Inhibitory learning rate parameter

    %% Initialized Values
    p_i_cs = 1; %Proportion at I
    p_i_cs2 = 1;
    p_i_us = 1;
    pa1_cs = 0; %Proportion at A1
    pa1_cs2 = 0;
    pa1_us = 0;
    pa2_cs = 0; %Proportion at A2
    pa2_cs2 = 0;
    pa2_us = 0;
    Vcsus = 0; %Associative strength
    Vcsus2 = 0;
    p2_cs = 0; %P(I --> A2)
    realvec = [0.4375, 0.375, 0.35,0.3125,0.2625,0.25,0.2525,0.2525,0.2525,0.175];
    realvec2 = [0.3, 0.275, 0.25, 0.2, 0.175, 0.15];
    realvec3 = [0.175,0.175,0.15,0.15,0.1,0.125];

    %% Context A1
    results = nan(1,10);
    
    for j = 1:10 %Ten trial blocks
        p_i_cs = 1; %Proportion at I
        p_i_us = 1;
        pa1_cs = 0; %Proportion at A1
        pa1_us = 0;
        pa2_cs = 0; %Proportion at A2
        pa2_us = 0;
    
        %Present Context (CS)
        [pa1_cs, pa2_cs, p_i_cs] = csnodeupdate(pa1_cs,pa2_cs,p_i_cs, p1_cs, d1, d2);
        %Possible p2_us update
        [p2_us,Vcsus] = association(Ln,pa1_cs,pa1_us, pa2_cs, Vcsus,r1,r2);
        %Update US without A1 transitiomn
        dpa2_us = d1 .* pa1_us + p2_us .* p_i_us - d2 .* pa2_us; %delta pa2
        dp_i_us = d2 .* pa2_us - (p1_us + p2_us) .* p_i_us ; %delta p_i
            
        pa2_us = pa2_us + dpa2_us;
        p_i_us = p_i_us + dp_i_us;
    
        for i = 1:10
            [pa1_cs, pa2_cs, p_i_cs] = csnodeupdate(pa1_cs,pa2_cs,p_i_cs, p1_cs, d1, d2);
            [p2_us,Vcsus] = association(Ln,pa1_cs,pa1_us, pa2_cs, Vcsus,r1,r2);
            [pa1_us,pa2_us,p_i_us] = usnodeupdate(pa1_us,pa2_us,p_i_us, p1_us,p2_us, d1,d2);
            [p_i_us, pa2_us, pa1_us] = corrector(p_i_us, pa2_us, pa1_us);
    
            results(i,j) = pa1_us;
        end
    
    
    end
    
    avvec = nan(1,10);
    for i = 1:10
        avvec(1,i) = mean(results(:,i));
    end
    
    plot(1:10,realvec,"o")
    hold on
    plot(1:10, avvec)
    hold off
    output = rootmeansquared(avvec,realvec);
    saveas(gcf,'SOP_1.png')


%% ContextB
results2 = nan(1,6);
    
    for j = 1:6 %Ten trial blocks
        p_i_cs2 = 1; %Proportion at I
        p_i_us = 1;
        pa1_cs2 = 0; %Proportion at A1
        pa1_us = 0;
        pa2_cs2 = 0; %Proportion at A2
        pa2_us = 0;
    
        %Present Context (CS)
        [pa1_cs2, pa2_cs2, p_i_cs2] = csnodeupdate(pa1_cs2,pa2_cs2,p_i_cs2, p1_cs, d1, d2);
        %Possible p2_us update
        [p2_us,Vcsus2] = association(Ln,pa1_cs2,pa1_us, pa2_cs2, Vcsus2,r1,r2);
        %Update US without A1 transitiomn
        dpa2_us = d1 .* pa1_us + p2_us .* p_i_us - d2 .* pa2_us; %delta pa2
        dp_i_us = d2 .* pa2_us - (p1_us + p2_us) .* p_i_us ; %delta p_i
            
        pa2_us = pa2_us + dpa2_us;
        p_i_us = p_i_us + dp_i_us;
    
        for i = 1:10
            [pa1_cs2, pa2_cs2, p_i_cs2] = csnodeupdate(pa1_cs2,pa2_cs2,p_i_cs2, p1_cs, d1, d2);
            [p2_us,Vcsus2] = association(Ln,pa1_cs2,pa1_us, pa2_cs2, Vcsus2,r1,r2);
            [pa1_us,pa2_us,p_i_us] = usnodeupdate(pa1_us,pa2_us,p_i_us, p1_us,p2_us, d1,d2);
            [p_i_us, pa2_us, pa1_us] = corrector(p_i_us, pa2_us, pa1_us);
    
            results2(i,j) = pa1_us;
        end
    
    
    end
    
    avvec2 = nan(1,6);
    for i = 1:6
        avvec2(1,i) = mean(results2(:,i));
    end
    figure(2)
    plot(1:6,realvec2,"o")
    hold on
    plot(1:6, avvec2)
    hold off
    output2 = rootmeansquared(avvec2,realvec2);
    saveas(gcf,'SOP_2.png')
    %% Context A2
     for j = 1:6 %Ten trial blocks
        p_i_cs = 1; %Proportion at I
        p_i_us = 1;
        pa1_cs = 0; %Proportion at A1
        pa1_us = 0;
        pa2_cs = 0; %Proportion at A2
        pa2_us = 0;
    
        %Present Context (CS)
        [pa1_cs, pa2_cs, p_i_cs] = csnodeupdate(pa1_cs,pa2_cs,p_i_cs, p1_cs, d1, d2);
        %Possible p2_us update
        [p2_us,Vcsus] = association(Ln,pa1_cs,pa1_us, pa2_cs, Vcsus,r1,r2);
        %Update US without A1 transitiomn
        dpa2_us = d1 .* pa1_us + p2_us .* p_i_us - d2 .* pa2_us; %delta pa2
        dp_i_us = d2 .* pa2_us - (p1_us + p2_us) .* p_i_us ; %delta p_i
            
        pa2_us = pa2_us + dpa2_us;
        p_i_us = p_i_us + dp_i_us;
    
        for i = 1:10
            [pa1_cs, pa2_cs, p_i_cs] = csnodeupdate(pa1_cs,pa2_cs,p_i_cs, p1_cs, d1, d2);
            [p2_us,Vcsus] = association(Ln,pa1_cs,pa1_us, pa2_cs, Vcsus,r1,r2);
            [pa1_us,pa2_us,p_i_us] = usnodeupdate(pa1_us,pa2_us,p_i_us, p1_us,p2_us, d1,d2);
            [p_i_us, pa2_us, pa1_us] = corrector(p_i_us, pa2_us, pa1_us);
    
            results3(i,j) = pa1_us;
        end
     end
    avvec3 = nan(1,6);
    for i = 1:6
        avvec3(1,i) = mean(results3(:,i));
    end
    figure(3)
    hold on
    plot(1:6,realvec3,"o")
    plot(1:6, avvec3)
    hold off
    saveas(gcf,'SOP_3.png')
        %% Functions
    function [pa1_cs, pa2_cs, p_i_cs] = csnodeupdate(pa1_cs,pa2_cs,p_i_cs, p1_cs, d1, d2)
        dpa1_cs = p1_cs .* p_i_cs - d1 .* pa1_cs; %delta pa1
        dpa2_cs = d1 .* pa1_cs - d2 .* pa2_cs; %delta pa2
        dp_i_cs = d2 .* pa2_cs - p1_cs .* p_i_cs; %delta p_i
            
        pa1_cs = pa1_cs + dpa1_cs;
        pa2_cs = pa2_cs + dpa2_cs;
        p_i_cs = p_i_cs + dp_i_cs;
    end
    
    function [pa1_us,pa2_us,p_i_us] = usnodeupdate(pa1_us,pa2_us,p_i_us, p1_us,p2_us, d1,d2)
        dpa1_us = p1_us .* p_i_us - d1 .* pa1_us; %delta pa1
        dpa2_us = d1 .* pa1_us + p2_us .* p_i_us - d2 .* pa2_us; %delta pa2
        dp_i_us = d2 .* pa2_us - (p1_us + p2_us) .* p_i_us ; %delta p_i
            
        pa1_us = pa1_us + dpa1_us;
        pa2_us = pa2_us + dpa2_us;
        p_i_us = p_i_us + dp_i_us;
    end
    
    function [p2_us, Vcsus] = association(Ln,pa1_cs,pa1_us, pa2_cs, Vcsus,r1,r2)
        dVn = Ln .* (pa1_cs .* pa1_us);
        Vcsus = Vcsus + dVn;
        if Vcsus > 1
            Vcsus = 1;
        end
        p2_us = Vcsus .* (r1.*pa1_cs + r2.*pa2_cs);
    end
    
    function [p_i_us, pa2_us, pa1_us] = corrector(p_i_us, pa2_us, pa1_us)
       while pa1_us < 0 || pa2_us < 0 || p_i_us < 0
                if pa1_us < 0 
                   pa2_us = pa2_us + pa1_us;
                   pa1_us = 0;
                end
                if pa2_us < 0
                    p_i_us = p_i_us + pa2_us;
                    pa2_us = 0;
                end
                if p_i_us < 0
                   pa1_us = pa1_us - p_i_us;
                   p_i_us = 0;
                end
       end
    end
    
    function output = rootmeansquared(avvec,realvec)
        output = rms((avvec-realvec));
    end
