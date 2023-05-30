%% Rescorla-Wagner Model for Habituation in Earthworms

%% Task 1 same stimuli with different context

% Stimulus context array
context = [1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1];
% Head retraction responses
response = [1 0.8 0.65 0.5375 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.95 0.65 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.3375 0.3375 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.3375 0.3375 0.3355 0.3335];

% The R-W model requires some sort of reward and feedback then it learns
% the association between stimuli for our purpose I presupposed a unknown event 
% which has no meaning or reward or feedback
% it's all zero so the worm de-associate the stimuli with the event over times. 
UnknownEvent=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

figure
hold on
plot(1:10,response(1:10));
plot(11:20,response(11:20));
plot(21:30,response(21:30));
legend ('contextA','contextB','contextA')
xlabel('Trial');
ylabel('Habituation response');
title('Worm Head Retraction');
hold off

%% The first thing that this experiment addresses is the association of different content but the same stimulus.

% Define the Rescorla-Wagner model parameters
LR = 0.1337; % Learning rate
WeakeningFactor = 0.0362;
V = [1 1]; % Initial associative strength for each context

simulatedResponse = zeros(length(UnknownEvent), 1);
% Simulate the habituation response using the Rescorla-Wagner model
for i = 1:length(UnknownEvent)
    delta_V = LR*(UnknownEvent(i) - sum(V(context(i))))'; % Update in associative strength
    V(context(i)) = V(context(i)) + delta_V; % Update associative strength for the current context
    for j = 1:length(V)
        if (j ~= context(i))
            V(j) = min(1, V(j) + WeakeningFactor); % Over time habituation weakens (with a cap on the response of 1)
        end
    end
    simulatedResponse(i) = sum(V(context(i))); % Calculate the habituation response for the current trial
end
loss = 0;
for i = 1:length(UnknownEvent)
    loss = loss + abs(simulatedResponse(i) - response(i));
end


% simulatedResponse = RW(LR, V, length(UnknownEvent), UnknownEvent, context);

LRs = 0.1:0.0001:0.15;
WFs = 0.02:0.0001:0.05;
losses = zeros(length(LRs),length(WFs));
for l = 1:length(WFs)
    for j = 1:length(LRs)
        V = [1 1];
        simulatedResponse = zeros(length(UnknownEvent), 1);
    
        % Simulate the habituation response using the Rescorla-Wagner model
        for i = 1:length(UnknownEvent)
            delta_V = LRs(j)*(UnknownEvent(i) - sum(V(context(i))))'; % Update in associative strength
            V(context(i)) = V(context(i)) + delta_V; % Update associative strength for the current context
            for k = 1:length(V)
                if (k ~= context(i))
                    V(k) = min(1, V(k) + WFs(l));
                end
            end
            simulatedResponse(i) = sum(V(context(i))); % Calculate the habituation response for the current trial
        end
    
        for i = 1:length(UnknownEvent)
            losses(j,l) = losses(j,l) + abs(simulatedResponse(i) - response(i));
        end
    end
end
[m, i] = min(min(losses));

% figure
hold on
plot(1:10,simulatedResponse(1:10));
plot(11:20,simulatedResponse(11:20));
plot(21:30,simulatedResponse(21:30));
legend ('contextA','contextB','contextA')
xlabel('Trial');
ylabel('Simulated response');
title('Simulated Response');
hold off

% input = struct;
% input.startPoint = LR;
% input.LB = 0;
% input.UB = 1;
% input.unknownEvent = UnknownEvent;
% input.V = V;
% input.context = context;
% input.responses = response;
% output = maxLikeFit(input);
% test = RWlike(LR, V, length(UnknownEvent), UnknownEvent, context)

