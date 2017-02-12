% NOTICE: At present this code can not be used at all.

[song,sFs]=audioread('input.wav');
% sound(song,sFs);
left=song(:,1);
right=song(:,2);
N=length(left);
lf=fft(left); %Fast Fourier transform
rf=fft(right); 
for i=1:N
    l(i)=lf(i)/abs(lf(i));
    r(i)=rf(i)/abs(rf(i));
    c(i)=l(i)+r(i);
end
a=dot(c,c);
temp1=l+r;
b=dot(c,temp1);
c1=dot(l,r);
%% solve the equation 
coeff=[a,-b,c1];  %coefficient matrix
o=roots(coeff);  %solution
a1=o(1); %% quadratic equation defined by coefficient  matrix
newc=a1*c;
newl=l-(a*l);
newr=r-(a*r);
ctime=ifft(newc);
ltime=ifft(newl);
rtime=ifft(newr);
% sound((50*ctime),44100)  % amplify
audiowrite('voiceonly.wav',ctime,44100); 
audiowrite('voiceonlyleft.wav',(0.0001*ltime),44100)  %left channel
audiowrite('voiceonlyright.wav',(0.0001*rtime),44100)  %right channel 
% Current issue is that it has lot of noise. If anyone interested to solve it can create a patch and create pull request. I will happyliy accept it.I am not working on this anymore
% Completely full of noise
