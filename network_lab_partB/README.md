## Steps to Compile and Execute Client-Server Program

### For program using FIFO as IPC Channels

Command to compile and execute
Open terminal and compile and execute the server program first

```
cc 10s.c
./a.out
```

Open another terminal and compile and execute client program.

```
cc 10c.c
./a.out
```
It will show following text.

```
trying to connect to server
connected...
enter the filename

```
Enter the filename "hello.txt"(It is in the same directory of your program).

```
trying to connect to server
connected...
enter the filename
hello.txt
```
Finally, it will show the content of requested file.

```
trying to connect to server
connected...
enter the filename
hello.txt
waiting for server to reply
HELLO WORLD!!
```

