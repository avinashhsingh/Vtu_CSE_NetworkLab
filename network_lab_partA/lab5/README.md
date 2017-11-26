## Execution steps

### Run the Simulator and AWK script

First, Run the simulator

```
ns lab5.tcl
```
### Compile and run the awk script 

```
awk -f lab5.awk lab5.tr file1.tr>tcp0
awk -f lab5.awk lab5.tr file2.tr>tcp2
```
### create a xgraph 

```
xgraph -x "time" -y "convalue" tcp0 tcp2
```
### Screenshot

![Alt text](xgraph1.png?raw=true "xgraph")


