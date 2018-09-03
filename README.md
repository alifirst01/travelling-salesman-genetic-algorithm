# travelling-salesman-problem-using-genetic-algorithm
Traveling Salesman problem is about finding the best route among all possible routes to cover n cities. It is an NP-hard optimization problem with large seach space.

## Genetic Algorithm
Genetic algorithm, a heuristic search algorithm is used to solve many search and optimization problems. For travelling salesman problem, a set of different selection techniques and fitness functions are applied to obtain the best route with maximum fitness.

### Cross Over Method
PMX Operator is used to perform 1-point, 2-point crossover [1] 
![image](https://user-images.githubusercontent.com/42689561/44969229-db19b500-af11-11e8-81f6-27865deccddd.png)

### Fitness Function
Normalized form of  1/(Sum of distances moving along the path – 300000)
e.g Fitness 330000 is sum of all distances along route becomes 3.33e-5

### Mutation Rate Tuning
Rate = Rate + par * (0.01 * abs(Max_Fitness - Fitness_Req) * 100000) [2]

### Selection Methods
- Stochastic Selection (Selection proportional to fitness probability)
- Tournament Selection (Selecting randomly 50 chromosomes from population and picking 5 best. The process is repeated to get full population)
- Randomized Best Selection (Our own method in which a random population is generated along with old and new population which are combined and best population is selected from the set.)

### Performance Comparisons
#### Stochastic Selection
Fitness Required: 330000                            Starting Fitness: 363001

| Cross Over  | No of Iterations | Fitness Acheived  | Tuned Mutation Rate |
| ------------- | ------------- | ------------- | ------------- |
| 1 Point  | 74  | 328442  | 15%  | 
| 2 Point  | 134  | 329741  | 12%  |
| Uniform  | 92  | 325196  | 9%  |

#### Tournament Selection
Fitness Required: 330000                            Starting Fitness: 365030

| Cross Over  | No of Iterations | Fitness Acheived  | Tuned Mutation Rate |
| ------------- | ------------- | ------------- | ------------- |
| 1 Point  | 203  | 329546  | 7%  | 
| 2 Point  | 107  | 343609  | 6%  |
| Uniform  | 80  | 338757  | 5%  |

#### Randomized Best Selection
Fitness Required: 330000                            Starting Fitness: 358757

| Cross Over  | No of Iterations | Fitness Acheived  | Tuned Mutation Rate |
| ------------- | ------------- | ------------- | ------------- |
| 1 Point  | 23  | 329908  | 9%  | 
| 2 Point  | 59  | 323726  | 10%  |
| Uniform  | 153  | 325119  | 9%  |

### Reference
1- Genetic Algorithm Solution of the TSP Avoiding Special Crossover and Mutation. G¨okt¨urk ¨Uc¸oluk, Department of Computer Engineering,Middle East Technical University 06531 Ankara, Turkey  
2- A Powerful Genetic Algorithm for Traveling Salesman Problem, Department of Computer Science, Sun Yat-sen University, Guangzhou 510006 China

