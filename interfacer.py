def main():
    import socket

    UDP_IP = "192.168.1.2"
    UDP_PORT = 5020

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # UDP
    sock.bind((UDP_IP, UDP_PORT))

    locSock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    locSock.connect(('127.0.0.1', 5022))

    while True:
        data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
        print("received message: {}".format(data))
        locSock.send(data.encode())


if __name__ == "__main__":
	main()
