## VTU Network Lab Program

This is the Network Lab Program prescribed by VTU University.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them.

```
git
network simulator 2
network animator
xgraph
```

### Installing

Steps to download the Prerequisites and clone the remote repository.

download and install git, ns2, nam, xgraph(needed for PartA-lab5).

```
sudo apt-get install git
sudo apt-get install ns2
sudo apt-get install nam
sudo apt-get install xgraph
```

clone the repository

```
sudo git clone https://github.com/avinashhsingh/Vtu_CSE_Network_Lab.git
```

Give the permission to the files present in directory Vtu_CSE_Network_Lab

```
sudo chmod -r 777 Vtu_CSE_Network_Lab/
```

## Run the Program

To run the network simulator, use the command

```
ns filename.tcl
```
To run the awk script, use the command

```
awk -f filename.awk filename.tr
```
To run the c program, use 

```
cc filename.c
./a.out
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

