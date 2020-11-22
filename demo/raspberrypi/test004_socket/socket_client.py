#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket

server_address = ('127.0.0.1', 9527, )

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# connect() to attach the socket directly to the remote address
sock.connect(server_address)

try:
    message = 'client message'
    sock.sendall(message.encode())
    reply = sock.recv(1024)
    print(reply.decode())
finally:
    sock.close()