# NEUR-1660-teamHabituation
# Modeling Context Dependent Habituation

## Group Members:
Sinistra Chengjun Pan  
Jeremy Fleming  
Max Newman  
Monica Ocitti  
Nathaniel Jesus-Lopes  

## Course Information:
Course: NEUR 1660  
Date: May 10, 2023

## Course Information:
Course: NEUR 1660 - Neural Computation in Learning and Decision-Making @Brown University 
Term: Spring 2023

## Overview:
Habituation is a form of learning that involves a decrease in responsiveness to a repeated stimulus. While habituation is widely observed in various organisms, the underlying mechanisms are not fully understood. This project aims to explore the associative nature of habituation by simulating the phenomenon using computational models. Three models were selected for this task: the Rescorla-Wagner (RW) model, Pearce-Hall/Rodriguez (PHR) model, and Sometimes Opponent Process (SOP) model. The simulations focus on context-dependent habituation and aim to compare the model results with experimental data from the paper "Contextual Specificity of Habituation in Earthworms". The goal is to gain insights into the mechanisms underlying habituation.

## Methods:
The project involved several key steps:

Analyzing research papers: The team analyzed research papers, including "Contextual Specificity of Habituation in Earthworms" by David Reyes-Jiménez and "When the Stimulus Is Predicted and What the Stimulus Predicts: Alternative Accounts of Habituation" by Geoffrey Hall, to understand the background information and experimental setup. Applying computational models: Three computational models (RW, PHR, and SOP) were implemented to simulate the habituation response in different contexts. Each model has its own set of parameters and learning rules. Comparing simulated and experimental data: The simulated data was compared to the experimental data obtained from the earthworm habituation experiment described in the research paper.  

### Rescorla-Wagner (RW) Model:  
The RW model is a widely used model for associative learning. It assumes that organisms learn to associate an outcome's occurrence with a stimulus's presence. In the case of habituation, the model simulates the decay in associative strength between the stimulus and the expected outcome. The RW model was implemented with parameters such as the learning rate (LR) and initial associative strength (V). A weakening factor was also added to account for the decline in habituation over time.

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
