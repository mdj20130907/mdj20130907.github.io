#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket
from threading import Thread

server_address = ('127.0.0.1', 9527, )
# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# bind() is used to associate the socket with the server address
sock.bind(server_address)
# listen() puts the socket into server mode, and accept() waits for an incoming connection
sock.listen(1)
print('listening on %s:%s' % server_address)

def excute(command):
    print(command)
    if command in ('stop', 'forward', 'back', 'left', 'right'):
        # TODO:
        pass

while True:
    print('waiting for a connection')
    (connection, client_address, ) = sock.accept()
    print('connection from %s:%s' % client_address)
    try:
        command = connection.recv(1024).decode()
        Thread(target=excute, args=(command, )).start()
    finally:
        connection.close()

sock.close()