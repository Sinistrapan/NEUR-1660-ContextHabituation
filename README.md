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
![alt text](https://github.com/Sinistrapan/NEUR-1660-ContextHabituation/blob/main/EarthwormsV3.jpg?raw=false)

### Rescorla-Wagner (RW) Model:  
The basic idea behind the RW model is that organisms learn to associate an outcome's occurrence with a stimulus's presence. This association's strength, known as the associative strength, is updated according to a simple learning rule that depends on the difference between the predicted and actual outcomes. In the case of habituation, the actual outcome is the absence of any significant event or reward, while the predicted outcome is based on the strength of the association between the stimulus and the expected outcome. If the stimulus is repeatedly presented without any significant event or reward, the strength of the association will gradually decrease, reflecting the organism's habituation to the stimulus.
The RW model is a simple yet effective model used to simulate associative learning. The model consists of a set of parameters that influence the rate of learning, including the learning rate (LR), the initial associative strength (V), and the salience of the stimulus (Salience). In our study, we set the LR to 0.1 and the V to 0.5 for both contexts. We ignored the salience parameter since we are doing a habituation simulation that uses the same stimulus with different contexts. RW relies on rewards to connect things together. Since we are doing a habituation task with no reward, the model should disassociate the stimulus from the expected occurrence. We named the reward as noEvent.
noEvents = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
The stimuli were applied in phases of 10 trials as described previously. 
context = [1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1];
Below is the loop to calculate the associative strength over trails. Where the delta_V is the change in associative strength on a given trial.
```
for i = 1:length(noEvents)
    delta_V = LR*(noEvents(i) - sum(V(context(i))))'; 
    V(context(i)) = V(context(i)) + delta_V; 
    simulatedResponse(i) = sum(V(context(i))); 
End
```

### Pearce-Hall/Rodriguez (PHR) Model:  
The PHR model incorporates the Rescorla-Wagner learning rule and a salience update rule to simulate habituation. The salience of stimuli is allowed to change over time, which can significantly affect the habituation response. The model includes variables such as context (CS), stimulus (US), associability (a), intensity of the US (lambda), and salience (S). The salience is updated after each trial based on the difference between the intensity of the US and the current strength of association between the CS and the absence of the US.

### Sometimes Opponent Process (SOP) Model:  
The SOP model considers habituation as a result of two opposing processes: activation (a-process) and inhibition (b-process). The model simulates the learning process by updating the strengths of different nodes based on the concurrent activation of the nodes. The model includes parameters such as probabilities (p1_cs, p1_us), decay rates (d1, d2), weights (r1, r2), and an inhibitory learning rate (Ln).

## Results:
The simulated data from the models was compared to the experimental data obtained from the earthworm habituation experiment. The models aimed to capture the habituation response in different contexts. The root mean squared error (RMSE) was calculated to assess the similarity between the simulated and experimental data. While the RMSE was approximately 0.05 for all models, the SOP model showed more potential due to its added complexity and additional variables.

## Conclusion:
The project aimed to explore the associative nature of habituation by simulating context-dependent habituation using computational models. The RW, PHR, and SOP models were implemented and compared to experimental data. While the models showed some ability to simulate habituation, they had limitations in accurately capturing all aspects of the phenomenon. The SOP model, with its added complexity, showed more promise for future work. However, due to time constraints, further exploration and refinement of the models were not possible.

## References:
Hall, G., & Rodriguez, G. (2020). "When the Stimulus Is Predicted and What the Stimulus Predicts: Alternative Accounts of Habituation". Journal of Experimental Psychology: Animal Learning and Cognition, 46(3), 327-340.  
Reyes-Jiménez, D., Iglesias-Parro, S., & Paredes-Olay, C. (2020). "Contextual Specificity of Habituation in Earthworms". Journal of Experimental Psychology: Animal Learning and Cognition, 46(3), 341-353.  
Rescorla, R. A. (1971). "Variation in the effectiveness of reinforcement and nonreinforcement following prior inhibitory conditioning". Learning and Motivation, 2(2), 113-123.  
Uribe-Bahamonde, Y. E., Becerra, S. A., Ponce, F. P., & Vogel, E. H. (2019). "A Quantitative Account of the Behavioral Characteristics of Habituation: The Sometimes Opponent Processes Model of Stimulus Processing". Frontiers in Psychology, 10, 504.  
