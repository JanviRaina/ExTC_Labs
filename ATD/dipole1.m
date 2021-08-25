clear all;
clc;
c=3.8e8;
f=2.45e9;
lambda=c/f;
%len=lambda/4;
%len=lambda/2;
%len=lambda;
len=(3/2)*lambda;
d1=dipole('Length',len,'Width',len/100,'Tiltaxis','z');
B = 2*pi/lambda;
t = 0:0.01:2*pi;
E = abs((cos(B*len/2*cos(t))-cos(B*len/2))./sin(t));
figure,pattern(d1,f), title('Radiation pattern');
figure,patternElevation(d1,f), 
figure,patternAzimuth(d1,f), 
title('hbpw')
