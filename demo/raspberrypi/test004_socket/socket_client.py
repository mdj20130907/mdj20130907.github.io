#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket

server_address = ('127.0.0.1', 9527, )

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# connect() to attach the socket directly to the remote address
sock.connect(server_address)

try:
    while True:
        command = input('Please input command name, exit/blank to stop:')
        print('input: ' + command)
        if not command or 'exit' == command:
            # 断开连接，不再发送数据
            break
        elif command in ('stop', 'forward', 'back', 'left', 'right'):
            print('send: ' + command)
            sock.sendall(command.encode())
finally:
    sock.close()