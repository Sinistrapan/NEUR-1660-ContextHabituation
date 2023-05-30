%% Rescorla-Wagner Model for Habituation in Earthworms

% Stimulus context array
context = [1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1];
% The R-W model requires some sort of reward and feedback then it learns
% the association between stimuli. For our purpose I presupposed a unknown event 
% which has no meaning or reward or feedback
% it's all zeros, so the worm de-associate the stimuli with the event over times. 
noEvents=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%% Using Rescorla-Wagner model to simulate earthworm experiment
% Define the Rescorla-Wagner model parameters
LR = 0.1; % Learning rate
V = [0.5 0.5]; % Initial associative strength for each context

for i = 1:length(noEvents)
    delta_V = LR*(noEvents(i) - sum(V(context(i))))'; % Update in associative strength
    V(context(i)) = V(context(i)) + delta_V; % Update associative strength for the current context
    simulatedResponse(i) = sum(V(context(i))); % Calculate the habituation response for the current trial
end

figure
hold on
plot(1:10,simulatedResponse(1:10));
plot(11:16,simulatedResponse(21:26));
yticks(0.05:0.05:0.5);
legend ('Habituation','Rehabituation')
xlabel('Block');
ylabel('Habituation response');
title('Simulated Worm Response');
hold off
saveas(gcf,'Simulated Worm Response.png')

%% actual experiments with curve fitting
% Pull data
paperRespond = [0.425 0.4 0.325 0.32 0.25 0.25 0.26 0.24 0.24 0.18 0.178 0.18 0.13 0.16 0.09 0.125]';
% Define the independent variable (trial number)
paperTrial = (1:length(paperRespond))';
% Define the function to fit to the data using the fittype function
ft = fittype('a*exp(-b*x) + c');
fun = @(a,b,c,x) a*exp(-b*x) + c;
% Perform the curve fitting
[fitresult, gof] = fit(paperTrial, paperRespond, ft, 'StartPoint', [0.5, 0.1, 0.1]);
% Plot the original data and the fitted curve
figure
hold on;
plot(1:10,paperRespond(1:10),'o');
plot(11:16,paperRespond(11:16),'o');
plot(fitresult, 'm');
yticks(0.05:0.05:0.5);
xlabel('Block');
ylabel('Response');
title('Curve Fitting with Experimental Earthworm Response');
legend('Data', 'Fitted Curve');
saveas(gcf,'Curve Fitting with Experimental Earthworm Response.png')
% Display the goodness-of-fit statistics
disp(gof);
hold off

%% Expected features
response = [1 0.8 0.65 0.5375 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.95 0.65 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.3375 0.3375 0.4525 0.3895 0.3475 0.3375 0.3475 0.3375 0.3375 0.3375 0.3355 0.3335];
figure
hold on
plot(1:10,response(1:10));
plot(11:20,response(11:20));
plot(21:30,response(21:30));
legend ('contextA','contextB','contextA')
xlabel('Trial');
ylabel('Habituation response');
title('Expected Features');
hold off
saveas(gcf,'Expected Features.png')

%% Simulate features of worm task using the Rescorla-Wagner model

% Define the Rescorla-Wagner model parameters
LR = 0.3; % Learning rate
V = [1 1]; % Initial associative strength for each context

for i = 1:length(noEvents)
    delta_V = LR*(noEvents(i) - sum(V(context(i))))'; % Update in associative strength
    V(context(i)) = V(context(i)) + delta_V; % Update associative strength for the current context
    simulatedResponse(i) = sum(V(context(i))); % Calculate the habituation response for the current trial
end

figure
hold on
plot(1:10,simulatedResponse(1:10));
plot(11:20,simulatedResponse(11:20));
plot(21:30,simulatedResponse(21:30));
legend ('contextA','contextB','contextA')
xlabel('Trial');
ylabel('Simulated response');
title('Simulated Features');
hold off
saveas(gcf,'Simulated Features.png')