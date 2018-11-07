-----------------------------------------------------------------------------------------------------------------------------

# Distance Detector :camel: :camel: :camel: 

## CAO1 :metal: :metal: :metal: 


#### Michal Ciebien, 266908 
#### Mihai Tirtara, 266097
#### Nikita Roskovs, 266900
#### Cristian Guba, 254104 
   ### _Supervisor: Jesper Kehlet Bangsholt_
   ### _CAO1, Semester III, 10/31/2018_
   
   
   
   Table of content

* Abstract
1. Introduction	
2. Requirements	
   2.1 Functional Requirements	
   2.2 Non-Functional Requirements	
3. Analysis	
4. Design	
5. Implementation	
6. Test	
   6.1Test Specifications	
7. Results and Discussion	
8. Conclusions
9. Project future	
10. Sources of information	
11. Appendices	




__Abstract__


*An abstract is a shortened version of the report and should contain all information necessary for the reader to determine:*
* *1.	What are the aim and objectives of the project*
* *2.	What are the main technical choices*
* *3.	What are the results*


*Frequently, readers of a report will only read the abstract, choosing to read at length those reports that are most interesting to them. For this reason, and because abstracts are frequently made available to engineers by various computer abstracting services, this section should be written carefully and succinctly to have the greatest impact in as few words as possible.*
*Although it appears as the first section in a paper, most report writers write the abstract section last.
Cf. (Dawson 2009, p.195).*


# __1 Introduction__

The purpose of the introduction is to provide background information and set the scene for your project. Within which business or organization are you doing the project? Who are the stakeholders and who is the customer?
The background information is adapted from your project description where you have already described the problem domain. Describe the current situation and existing context. Your statements must be supported by references to reliable and relevant sources. 

This should lead to why this project is relevant and outline your aim and objectives. Which technical problems and challenges will be presented in this report, again taken from your project description. System illustrations and rich pictures are welcome here.

State delimitations relevant for your project in the introduction. Delimitations include what the project will not cover in relation to your project description, i.e. what could have been expected in your project. Remember that you can only make delimitations to aspects mentioned in the project description and you must argue well for your delimitations.
The last sentences of the introduction should be an overview of the sections to follow. This will be a good transition to the next sections.

Remember: You must ensure a clear connection between sections in the project report, from Project Description, Requirements, Analysis, Design, Implementation to Test. This means that everything that is implemented can be found in design, everything that is designed is based on the analysis, and anything that is found in analysis has a clear link to requirements, etc.


# __2	Requirements__

### __2.1 Functional requirements__

1. The device should emit sound if it gets close to the object
2.	The sound emission frequency rate should be dependent on the distance from the object

### __2.2	Non-Functional Requirements__

1.	The device should be built using Arduino AVR and basic components
2.	The device should be programmed using Assembly language

# __3	Analysis__

In the analysis part we discuss the work of the device on the conceptual level. We refer to UML diagrams and class discussions in order to get a better overview of how the device should later be designed and implemented.

# __3. 1.1	State-machine diagrams__

We start our analysis with discussing the workflow of the machine.

![Alt Text](https://imgur.com/a/bN7IshQ)
