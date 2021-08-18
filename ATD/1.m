m=monopole('Height',0.20129,'Width',0.00085655,'GroundPlaneLength',0.062827,'GroundPlaneWidth',0.062827);
figure(1);show(m)
% Radiation Patttern of Monopole Antenna
figure(2);pattern(m,3.5e9)
% Azimuth and Elevation Pattern of Antenna
figure(3);patternAzimuth(m,3.5e9)
figure(4);patternElevation(m,3.5e9)
% Directivity of Antenna
Directivity=pattern(m,3.5e9,0.90);
% EHfields of Antenna
[E,H] = EHfields(m,3,5e9,[0;0;1]);
% Axial Ratio of Antenna
ar= axialRatio(m,3.5e9,20,30);
% Beamwidth of Antenna
[bw,angles]=beamwidth(m,3.5e9,0,1:1:360);
%Impedance of Antenna
figure(5);impedance(m,3150e6:35e6:3850e6)

% Reflection Coefficient of Antenna
s=sparameter(m,3150e6:5e6:3850e6);
figure(6);rflot(s)
y=rfparam(s,1,1);
k=abs(y);
x=mag2db(k);

%Return Loss of Antenna
figure(7); returnLoss(m,3150e6:35e6:3850e6,72)

% Voltage Standing Wave Ratio (VSWR) of Antenna
figure(8); vswr(m,3150e6:35e6:3850e6,72)

% CUrrent and Charge Distribution of Antenna
figure(9); charge(m,2.01e9)

% Mesh of Antenna
figure(10);mesh(m)
