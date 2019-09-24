import RPi.GPIO as GPIO
import time

switch = 7
joystick_x = 20
joystick_y = 21
button = 12

if __name__ == '__main__':

    #print out phrase on button click
    #3 states:

    #switch on --------- Mean: "Hey, ugly! Get lost!"
    #joystick x=0 ------ Nice: "Hey you look like a hot piece a pie today."
    #joystick y=0 ------ Confused: "What? Who are you? How did I get here? SET ME FREE!"

    #switch off -------- no output

    GPIO.setmode(GPIO.BCM)

    # Joystick
    GPIO.setup(joystick_x, GPIO.IN)
    GPIO.setup(joystick_y, GPIO.IN)

    # Switch
    GPIO.setup(switch, GPIO.IN)

    # Button
    GPIO.setup(button, GPIO.IN)
    phrasenum = 0
    phrases = ["Hey, ugly! Get lost!",
    "Hey you look like a hot piece a pie today.",
    "What? Who are you? How did I get here? SET ME FREE!"]
    while True:
        if GPIO.input(switch):
            phrasenum=0
            if not GPIO.input(joystick_x):
                phrasenum=1
            elif not GPIO.input(joystick_y):
                phrasenum=2
            if GPIO.input(button):
                print(phrases[phrasenum])
                time.sleep(1)



# Resting state joystick: switch on and off, 1
# XLeft: 0, XRight: 1
# YDown: 1, YUp: 0
