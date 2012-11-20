gyroBroadcast
=============

I'm piecing together code to broadcast iOS sensor data to a socket over UPD for use
with microcontroller frameworks. I'm starting with a focus on accelerometer and gyroscope
parameters, and working towards support for gps later. This is meant specifically to work with
The beaglebone (http://beagleboard.org/bone) and 

UDP is being handled by AsyncUdpSocket. The library is public domain, originally
written by Dustin Voss, and now maintained by Deusty and the Cocoa community.
https://github.com/roustem/AsyncSocket

Gyroscope and Accelerometer code originally from a tutorial by Hersh Bhargava
http://h2micro.com, http://www.youtube.com/watch?v=Xk5cJlhePCI