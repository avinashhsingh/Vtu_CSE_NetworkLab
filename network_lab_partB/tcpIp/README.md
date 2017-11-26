## Steps to Compile and Execute Client-Server Program

### For program using TCP/IP

Command to compile and execute
Open terminal and compile and execute the server program first

```
cc 9s.c
./a.out
```

Open another terminal and compile and execute client program.<br/>
Execute using ./a.out followed by IP address of server(It can be local or remote)<br/>
Using 127.0.0.1 for local IP address or get the IP address of remote server and use it instead of local IP address to request a file from remote server(Make sure that remote server is running a server program). 

```
cc 9c.c
./a.out 127.0.0.1
```

It will show following text.

```
The socket was created
The connection was accepted with the server 127.0.0.1...
Enter the Filename to Request:
```
Enter the filename "hello.txt"(It is in the same directory of your program).

```
The socket was created
The connection was accepted with the server 127.0.0.1...
Enter the Filename to Request:hello.txt
```
Finally, it will show the content of requested file.

```
The socket was created
The connection was accepted with the server 127.0.0.1...
Enter the Filename to Request:hello.txt
Request Accepted... Recieving File...

The content of File are...

HELLO WORLD!!

EOF
```

