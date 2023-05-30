%% YOU CAN SKIP THIS PART, THESE ARE JUST HOUSEKEEPING NOTES:

% So accoriding to the Hall and Rodriguez theory, habituation can be
% modeled as the process of learning that no event/consequence will occurs after a stimulus is presented


% How is this different form RW?

% **Hall and Rodriguez (H&R) theory based on the Pearce and Hall(P&H) theory**
% P&H: Postulate that, errors promote chnage in associative strenth by
%      modulating attention and processing of events
% RW: emphasises thht errors directly drive changes in associative strength

% DEFINITION OF VARIABLES: 

% CS: Context
% US: Light
% V_no_event: Strength of association between stimulus and no event occuring after stimulus presentation
% V_event: Strength of association between stimulus and event occuring after stimulus presentation
% V_net: Overall associaility between stimulus and consequence(event happening or no event happening)
% S: Salience of CS
% a: associability of CS. i.e. how easy it is to associate CS with US
% lambda: intensity of US


%% GROUP 1: 

% MODEL INITIALISERS:

trials = 31; % number of stimulus presentations - 1

% DATA STORAGE STUFF:

S = zeros(trials,1); % Store salience values for context A
a = zeros(trials,1); % Store associaility values
delta_V_no_event = zeros(trials,1); % Store changes in V_no_event
V_no_event = zeros(trials,1);  % Store values of V_no_event at each trial
lambda_no_event = zeros(trials,1);  %Store values of V_no_event at each trial

% CONTEXT A INITIALISERS:

S(1) = 0.4;  % Initial salience of CS
a(1) = 1;    % Initial associability
V_event = 0.5; % Stimulus-event association strength. 
               % This value remains constant accross trials because... brb idk
               % how to articulate it rn
V_no_event(1) = 0.1; % Initias stimulus-event association strength
lambda_event = 0; % Initial intensity of US

%HABITUATION TO STIMULUS X UNDER CONTEXT A OVER 10 TRIALS FOR G1 :

for n = 2:11 
    delta_V_no_event(n) = S(n-1) * a(n-1) * lambda_no_event(n-1);
    a(n) = abs(lambda_event - (V_event - sum(V_no_event(n-1))));
    V_no_event(n) = delta_V_no_event(n) - delta_V_no_event(n-1);
    S(n) = abs(V_event - V_no_event(n));
    lambda_no_event(n) = V_event - sum(V_no_event);
end

%HABITUATION TO STIMULUS X UNDER CONTEXT A OVER ANOTHER 10 TRIALS FOR G1:

% *it's really just continuing the first part*

for n = 12:21 
    delta_V_no_event(n) = S(n-1) * a(n-1) * lambda_no_event(n-1); % change in strength of association between stimulus and no event occuring after stimulus presentation
    a(n) = abs(lambda_event - (V_event - sum(V_no_event(n-1))));
    V_no_event(n) = delta_V_no_event(n) - delta_V_no_event(n-1);
    S(n) = abs(V_event - V_no_event(n));
    lambda_no_event(n) = V_event - sum(V_no_event);
end

% PLOTS:
figure
plot(1:11,a(1:11),'o-')
ylim([0 1])
xlabel('Trial Number')
ylabel('Associability')
title('GROUP 1: HABITUATION TO STIMULUS X UNDER CONTEXT A')
saveas(gcf,'GROUP 1: HABITUATION TO STIMULUS X UNDER CONTEXT A.png')

figure
plot(12:21,a(12:21),'o-')
ylim([0 1])
xlabel('Trial Number')
ylabel('Associability')
title('GROUP 1: RE-HABITUATION TO STIMULUS X UNDER CONTEXT A')
saveas(gcf,'GROUP 1: RE-HABITUATION TO STIMULUS X UNDER CONTEXT A.png')
%% GROUP 2:

% DATA STORAGE STUFF:

S = zeros(trials,1); % Store salience values for context A
a = zeros(trials,1); % Store associaility values
delta_V_no_event = zeros(trials,1); % Store changes in V_no_event
V_no_event = zeros(trials,1);  % Store values of V_no_event at each trial
V_net = zeros(trials,1);
lambda_no_event = zeros(trials,1);  %Store values of V_no_event at each trial


% CONTEXT A INITIALISERS:

S(1) = 0.4;  % Initial salience of CS
a(1) = 1;    % Initial associability
V_event = 0.5; % Stimulus-event association strength. 
               % This value remains constant accross trials because... brb idk
               % how to articulate it rn
V_no_event(1) = 0.1; % Initias stimulus-event association strength
lambda_event = 0; % Initial intensity of US

%HABITUATION TO STIMULUS X UNDER CONTEXT A FOR G2:

for n = 2:11 % Context A
    delta_V_no_event(n) = S(n-1) * a(n-1) * lambda_no_event(n-1);
    a(n) = abs(lambda_event - (V_event - sum(V_no_event(n-1))));
    V_no_event(n) = delta_V_no_event(n) - delta_V_no_event(n-1);
    S(n) = abs(V_event - V_no_event(n));
    lambda_no_event(n) = V_event - sum(V_no_event);
end

%HABITUATION TO STIMULUS X UNDER CONTEXT B FOR G2:

% CONTEXT B INITIALISERS:

S(12) = 0.4;  % Initial salience of CS
a(12) = 1;    % Initial associability
V_event = 0.5; % Stimulus-event association strength. 
               % This value remains constant accross trials because... brb idk
               % how to articulate it rn
V_no_event(12) = 0.1; % Initias stimulus-event association strength
lambda_event = 0; % Initial intensity of US

for n = 13:21 
    delta_V_no_event(n) = S(n-1) * a(n-1) * lambda_no_event(n-1);
    a(n) = abs(lambda_event - (V_event - sum(V_no_event(n-1))));
    V_no_event(n) = delta_V_no_event(n) - delta_V_no_event(n-1);
    S(n) = abs(V_event - V_no_event(n));
    lambda_no_event(n) = V_event - sum(V_no_event);
end
figure
plot(1:11,a(1:11),'o-')
ylim([0 1])
xlabel('Trial Number')
ylabel('Associability')
title('GROUP 2: HABITUATION TO STIMULUS X UNDER CONTEXT A')
saveas(gcf,'GROUP 2: HABITUATION TO STIMULUS X UNDER CONTEXT A.png')


figure
plot(12:21,a(12:21),'o-')
ylim([0 1])
xlabel('Trial Number')
ylabel('Associability')
title('GROUP 2: RE-HABITUATION TO STIMULUS X UNDER CONTEXT B')
saveas(gcf,'GROUP 2: RE-HABITUATION TO STIMULUS X UNDER CONTEXT B.png')


