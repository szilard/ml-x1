
## Machine learning tools on monster EC2 X1 instance (128 cores, 2 TB RAM) 

Despite the deep learning hype, for most supervised learning problems on tabular data 
(the ones usually encountered in business) gradient boosting machines (GBMs) most often beat
all other algorithms. 

The two best of the most widely used open source implementations for GBMs 
are h2o and xgboost (see [benchmarks](https://github.com/szilard/benchm-ml)).

In this repo I'll play with h2o and xgboost GBMs on Amazon EC2's X1 instance with 128 cores.



## Experiments with h2o


### on r3.8xlarge (32 cores)

r3.8xlarge has 2 CPU sockets with 8+8 hyperthreaded cores each

Cores 0-7 are on CPU1, 8-15 on CPU2, then 16-23 are hyperthread pairs of 0-7 etc.

![img](res-r3-h2o-hyper.png)

From 0-3 (4 cores) adding another 4 cores hyperthreades (16-19) will speed up a bit,
but not even half-way as having 8 "real" cores. 

Having 8 real cores on 1 socket (0-7) is a bit better than on 2 sockets (0-4 & 8-11).

From 8 cores (0-7) to 16: if the added cores are hyperthreaded, there is only a 
little speedup (0-7 & 16-23). Adding real cores (0-15) helps.

There is almost no benefit from 16 cores to 32.

With no hyperthreaded cores, the relative speedup vs linear:

![img](res-r3-h2o-scaling.png)

Weird that smaller r3 instances run faster:

Instance     | Time (s) 0-7  |  Time (s) 0-3 
-------------|---------------|----------------
r3.8xlarge   |   27          |    49
r3.4xlarge   |   24          |    44 
r3.2xlarge   |               |    44

r3.4xlarge should be 1 socket of the 2 sockets of r3.8xlarge.



### on x1.32xlarge (128 cores)

x1.32xlarge has 4 CPU sockets with 16+16 hyperthreaded cores each

Cores 0-15 are on CPU1, 16-31 on CPU2 etc., then 64-79 are hyperthread pairs of 0-15 etc.

![img](res-x1-h2o-hyper.png)

8 cores: best on 1 CPU "real cores" (0-7), then 2 CPUs (0-3,16-19), then 1 CPU hyperthreaded (0-3,64-67).

16 cores: best on 1 CPU "real cores" (0-15), then adjacent CPU, then other CPU and hyperthreaded.

32 cores: best 1 CPU hyperthreaded (!) (0-15,64-79), then 2 adjacent CPUs "real cores" (0-31), then other 2 CPU configs.

64 cores: similar for 4 CPUs and 2 CPUs with hyperthreading.

128 cores: same as 64 cores (no extra benefit).


With no hyperthreaded cores, the relative speedup vs linear:

![img](res-x1-h2o-scaling.png)


This is weird: r3 is faster than x1 on same number of cores. Furthermore r3 32 cores is faster than x1 with all 
128 cores.

![img](res-h2o.png)






## Experiments with xgboost


### on r3.8xlarge (32 cores)

This is very weird: xgboost on 4 or 32 cores runs way faster than on 8 or 16 cores:

![img](res-r3-xgboost-hyper.png)



### on x1.32xlarge (128 cores)


