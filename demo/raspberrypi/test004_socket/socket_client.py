#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket

server_address = ('192.168.4.1', 9527, )

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# connect() to attach the socket directly to the remote address
sock.connect(server_address)

# fuck input/raw_input 2/3
try:
    input = raw_input
except NameError:
    pass

input_flag = True
try:
    while input_flag:
        command = input('Please input command name, exit to stop:')
        print('input:"%s"' % (command, ))

        # 命令简写
        if 'f' == command:
            command = 'forward'
        elif 'b' == command:
            command = 'back'
        elif 'l' == command:
            command = 'left'
        elif 'r' == command:
            command = 'right'
        elif 's' == command:
            command = 'stop'

        # exit 服务端不再read
        # shutdown 服务端不再accept
        if command in ('exit', 'shutdown', 'stop', 'forward', 'back', 'left', 'right'):
            print('send: ' + command)
            sock.sendall(command.encode())
            if 'exit' == command: # 断开当前连接
                input_flag = False
                continue
            elif 'shutdown' == command: # 关闭服务端，同时断开当前连接
                input_flag = False
                continue
finally:
    sock.close()

# 用例
# 1. 直接ctrl+c退出客户端
# 2. exit
# 3. shutdown
# 4. 其他输入