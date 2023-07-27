clc
clear all
close all
x1=edfread('Epileptic_patient_EEG_data.edf');
x=x1.C3__{1,1};
x=x(1:160,1);
n=1:160;
subplot (3,3,1)
plot(x,'r');
title('Raw EEG signal');
x1=x'+randn(size(n));
pwlc=pwelch(x1);
pxx = pwelch(pwlc);
subplot (3,3,2)
plot(pwlc,'g');
title('pwelch Coefficient');
subplot (3,3,3)
plot(pxx,'r');
title('PSD of pwelch Signal');
c=0.0001/500;d=3/500;
[b,a]=butter(3,[c,d]);
Delta=filter(b,a,pwlc);
subplot (3,3,4);plot(Delta);title('Delta');
%Theta
c=4/500;d=8/500;[b,a]=butter(3,[c,d]);Theta=filter(b,a,pwlc);
subplot (3,3,5);plot(Theta);title('Theta');
%Alpha
c=8/500;d=13/500;[b,a]=butter(3,[c,d]);
Alpha=filter(b,a,pwlc);subplot (3,3,6);plot(Alpha);title('Alpha');
%Beta
c=14/500;d=30/500;[b,a]=butter(3,[c,d]);Beta=filter(b,a,pwlc);
subplot (3,3,7);plot(Beta);title('Beta');
