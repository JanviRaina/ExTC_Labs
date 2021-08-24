%plot_PL_general.m

%MIMO-OFDM Wireless Communications with MATLAB¢ç   Yong Soo Cho, Jaekwon Kim, Won Young Yang and Chung G. Kang
%2010 John Wiley & Sons (Asia) Pte Ltd

clear all, clf, clc;
fc=9e9;  d0=100;  sigma=3;
distance=[1:2:100].^2;
Gt=[1 3 4]; Gr=[1 1.5 4]; Exp=[2 3 6]; 
for k=1:3
   y_Free(k,:)= PL_free(fc,distance,Gt(k),Gr(k));
   y_logdist(k,:)= PL_logdist_or_norm(fc,distance,d0,Exp(k));
   y_lognorm(k,:)= PL_logdist_or_norm(fc,distance,d0,Exp(1),sigma); % ??
end
subplot(131)
semilogx(distance,y_Free(1,:),'k-o',distance,y_Free(2,:),'g-^',distance,y_Free(3,:),'r-s')
grid on, axis([1 1000 40 110]), title(['Free PL Models, f_c=',num2str(fc/1e6),'MHz'])
xlabel('Distance[m]'), ylabel('Path loss[dB]')
legend('G_t=1, G_r=1','G_t=3, G_r=1.5','G_t=4, G_r=4','NorthWest')
subplot(132)
semilogx(distance,y_logdist(1,:),'k-o',distance,y_logdist(2,:),'g-^',distance,y_logdist(3,:),'r-s')
grid on, axis([1 1000 40 110]),
title(['Log-distance PL model, f_c=',num2str(fc/1e6),'MHz'])
xlabel('Distance[m]'), ylabel('Path loss[dB]'), legend('n=2','n=3','n=6','NorthWest')
subplot(133)
semilogx(distance,y_lognorm(1,:),'k-o',distance,y_lognorm(2,:),'g-^',distance,y_lognorm(3,:),'r-s')
grid on, axis([1 1000 40 110]),
title(['Log-normal PL model, f_c=',num2str(fc/1e6),'MHz, ','\sigma=', num2str(sigma), 'dB'])
xlabel('Distance[m]'), ylabel('Path loss[dB]'), legend('path 1','path 2','path 2','NorthWest')
