# Modeling Context Dependent Habituation

## Group Members:
Sinistra Chengjun Pan  
Jeremy Fleming  
Max Newman  
Monica Ocitti  
Nathaniel Jesus-Lopes  

## Course Information:
Course: NEUR 1660 - Neural Computation in Learning and Decision-Making @Brown University  
Term: Spring 2023

## Overview:
Habituation, the decrease in responsiveness to a stimulus after repeated presentations, is a fundamental form of learning that has been extensively studied in various organisms. Despite its ubiquity in nature, the mechanisms underlying habituation are still not fully understood. Recent research has suggested that habituation may be associative in nature, occurring through the association of the stimulus and the context in which it is presented. To better understand the associative nature of habituation, this project aims to simulate the phenomenon of habituation with computational models. We selected three computer models: the Rescorla-Wagner (RW) model, Pearce-Hall/Rodriguez (PHR) Model, and Sometimes Opponent Process (SOP) Model and made simulations while considering context and stimulus to model habituation. Specifically, we will test the model against input in different contexts to see if it can successfully demonstrate context-dependent habituation. Our main methodology is computational, and we will try to simulate the experiments in the paper "Contextual Specificity of Habituation in Earthworms" to see if our model results match data from the literature. We hope this project will contribute to a better understanding of the mechanisms underlying habituation.

## Methods:
Our approach consists of three key steps: analyzing research papers for background information, applying computational models to simulate the earthworm experiment, and comparing simulated data with experimental data.  
To build a foundation of understanding habituation, we have analyzed two research papers:"Contextual Specificity of Habituation in Earthworms" by David Reyes-Jiménez And "When the Stimulus Is Predicted and What the Stimulus Predicts: Alternative Accounts of Habituation" by Geoffrey Hall.  
The paper "Contextual Specificity of Habituation in Earthworms" describes an experiment that used odors as stimuli. The researchers presented different odors by attaching a piece of filter paper with either rose or vanilla fragrance to the lid of a Petri dish. They varied the odors by replacing lids. The earthworms were exposed to light, and the researchers recorded the earthworms' head retraction responses.  
Building on the experiments in the earthworm paper, we have refined a task. We envision giving the earthworm a stimulus content 1 during the habituation phase, followed by the same stimulus but with content 2 during a block, and finally providing context 1 again during a re-habituation phase. In this project, we used three different models to investigate the associative nature of habituation: the Rescorla-Wagner (RW) model, the Pearce-Hall/Rodriguez (PHR) model, and the Sometimes Opponent Process (SOP) model.  
<img src="https://github.com/Sinistrapan/NEUR-1660-ContextHabituation/blob/main/EarthwormsV3.jpg" width="350">

### Rescorla-Wagner (RW) Model:  
The basic idea behind the RW model is that organisms learn to associate an outcome's occurrence with a stimulus's presence. This association's strength, known as the associative strength, is updated according to a simple learning rule that depends on the difference between the predicted and actual outcomes. In the case of habituation, the actual outcome is the absence of any significant event or reward, while the predicted outcome is based on the strength of the association between the stimulus and the expected outcome. If the stimulus is repeatedly presented without any significant event or reward, the strength of the association will gradually decrease, reflecting the organism's habituation to the stimulus.  
The RW model is a simple yet effective model used to simulate associative learning. The model consists of a set of parameters that influence the rate of learning, including the learning rate (LR), the initial associative strength (V), and the salience of the stimulus (Salience). In our study, we set the LR to 0.1 and the V to 0.5 for both contexts. We ignored the salience parameter since we are doing a habituation simulation that uses the same stimulus with different contexts. RW relies on rewards to connect things together. Since we are doing a habituation task with no reward, the model should disassociate the stimulus from the expected occurrence. We named the reward as noEvent.  
```
noEvents = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
```
The stimuli were applied in phases of 10 trials as described previously.  
```
context = [1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1];
```
Below is the loop to calculate the associative strength over trails. Where the delta_V is the change in associative strength on a given trial.  
```
for i = 1:length(noEvents)
    delta_V = LR*(noEvents(i) - sum(V(context(i))))'; 
    V(context(i)) = V(context(i)) + delta_V; 
    simulatedResponse(i) = sum(V(context(i))); 
End
```
<img src="https://github.com/Sinistrapan/NEUR-1660-ContextHabituation/blob/main/Figure2.jpg" width="100%">

### Pearce-Hall/Rodriguez (PHR) Model:  
According to the Hall and Rodriguez theory, habituation can be modeled as the process of learning that no event or consequence will occur after a stimulus is presented. The model consists of two main components: the Rescorla-Wagner learning rule and a rule for updating the salience of the stimuli. The PHR model allows the salience of the stimuli to change over time, which can significantly impact the habituation response. In our study, we used the PHR model to simulate the habituation response of earthworms in different contexts. We defined several variables, including the context (CS), stimulus (US), associability of the context (a), intensity of the US (lambda), strength of the association between the stimulus and no event occurring after stimulus presentation (V_no_event), and an initial salience (S) of 0.4 for each context. We updated the salience after each trial using the following equations:
```
delta_V_no_event(n) = S(n-1) * a(n-1) * lambda_no_event(n-1);
a(n) = abs(lambda_event - (V_event - sum(V_no_event(n-1))));
V_no_event(n) = delta_V_no_event(n) - delta_V_no_event(n-1);
S(n) = abs(V_event - V_no_event(n));
lambda_no_event(n) = V_event - sum(V_no_event);
```

We use S to calculate the change in associative strength (delta_V_no_event) between the conditioned stimulus (CS) and the absence of the unconditioned stimulus (US) for each trial. This change is then used to update the overall associative strength between the CS and the US (V_no_event). In addition, S is used to update the associability of the CS (a), which represents how easily the CS can be associated with the US. Specifically, S is used to calculate the absolute difference between the intensity of the US (lambda_event) and the difference between the current strength of association between the CS and the US (V_event = 0.5) and the sum of all previous strengths of association between the CS and the absence of the US (V_no_event). Figure-5 on the next page shows the associability of stimulus across the trials in different phases.  
<img src="https://github.com/Sinistrapan/NEUR-1660-ContextHabituation/blob/main/Figure5.jpg" width="100%">

### Sometimes Opponent Process (SOP) Model:  
The SOP model claims that motivations are controlled by a network of nodes that react to different stimuli. These nodes go through inactive, active 1, and active 2 states in response to stimuli. The model considers the opponent process theory of motivation, which suggests that the habituation response results from two opposing processes: an activation process (a-process) and an inhibition process (b-process). Figure 4 on the right explained the SOP model in theory. In our study, we used the SOP model to simulate the habituation response of earthworms in different contexts. Below is the parameters for SOP model:

```
p1_cs = 0.3608;
p1_us = 0.4156;
d1 = 0.0891;
d2 = 0.0996; 
r1 = 0.8780;
r2 = 0.7042; 
Ln = 0.0516; 
```
p1_cs is the correlated intensity for node I to node A1; d1 and d2 are the decay parameter for node A1 to node A2 and node A2 to node I; r1 and r2 represent the weight of pa1_cs and pac2_cs; ln is the inhibitory learning rate. The main simplification of our SOP model is that there is only one parameter for d1 and d2 that is present for both the US and the CS, rather than them each having their own. The SOP model defines 3 delta values, for the change in pa1, pa2 and pI by multiplying the current number of nodes in each state by the probability of them moving to the next state, and then adding those to the next state while subtracting them from the initial state.  

```
dVn = Ln .* (pa1_cs .* pa1_us);
Vcsus = Vcsus + dVn;
if Vcsus > 1
  Vcsus = 1;
```

<img src="https://github.com/Sinistrapan/NEUR-1660-ContextHabituation/blob/main/Figure7.jpg" width="100%">

Association is what allowed learning to happen, as you can see in the first line, pa1_cs and pa1_us are multiplied because the concurrent activation of nodes is what leads to learning, then the this value is added to Vcsus which is the strength of association, and this is multiplied by the sum of the CS nodes in A1 and A2 to get the p2_us parameter, which sends nodes from I to A2.  

## Conclusion:
The project aimed to explore the associative nature of habituation by simulating context-dependent habituation using computational models. The simulated data from the models was compared to the experimental data obtained from the earthworm habituation experiment. The models aimed to capture the habituation response in different contexts. The root mean squared error (RMSE) was calculated to assess the similarity between the simulated and experimental data. While the RMSE was approximately 0.05 for all models, the SOP model showed more potential due to its added complexity and additional variables. However, all models had limitations in accurately capturing all aspects of the habituation phenomenon. 

## References:
Hall, G., & Rodriguez, G. (2020). "When the Stimulus Is Predicted and What the Stimulus Predicts: Alternative Accounts of Habituation". Journal of Experimental Psychology: Animal Learning and Cognition, 46(3), 327-340.  
Reyes-Jiménez, D., Iglesias-Parro, S., & Paredes-Olay, C. (2020). "Contextual Specificity of Habituation in Earthworms". Journal of Experimental Psychology: Animal Learning and Cognition, 46(3), 341-353.  
Rescorla, R. A. (1971). "Variation in the effectiveness of reinforcement and nonreinforcement following prior inhibitory conditioning". Learning and Motivation, 2(2), 113-123.  
Uribe-Bahamonde, Y. E., Becerra, S. A., Ponce, F. P., & Vogel, E. H. (2019). "A Quantitative Account of the Behavioral Characteristics of Habituation: The Sometimes Opponent Processes Model of Stimulus Processing". Frontiers in Psychology, 10, 504.  
