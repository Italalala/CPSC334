def main():
    import socket

    UDP_IP = "192.168.1.2"
    UDP_PORT = 5002

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # UDP
    sock.bind((UDP_IP, UDP_PORT))

    while True:
        data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
        print("received message: {}".format(data))


if __name__ == "__main__":
	main()
