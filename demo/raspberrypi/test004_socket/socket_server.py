#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket
from threading import Thread

# TODO: 队列保证了在一个时间点只有一个command在执行

server_address = ('127.0.0.1', 9527, )
# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# bind() is used to associate the socket with the server address
sock.bind(server_address)
# listen() puts the socket into server mode, and accept() waits for an incoming connection
sock.listen(1)
print('listening on %s:%s' % server_address)

def execute(command):
    # TODO:
    pass

while True:
    print('waiting for a connection')
    (connection, client_address, ) = sock.accept()
    print('connection from %s:%s' % client_address)
    try:
        while True:
            command = connection.recv(1024).decode()
            print('receive: ' + command)
            if not command or 'exit' == command:
                # 客户端已经断开连接/发送空数据，不再继续读取数据
                break
            elif command in ('stop', 'forward', 'back', 'left', 'right'):
                print('execute: ' + command)
                Thread(target=execute, args=(command, )).start()
    finally:
        connection.close()

sock.close()