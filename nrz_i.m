bits=[1 0 1 1 0 1 0 0 1 1];
bitrate=1;
T=length(bits)/bitrate;
n=1000;
N=n*length(bits);
dT=T/N;
t=0:dT:T;

last_bit=1;
y=zeros(1,length(t));
for i=0:length(bits)-1;
  if(bits(i+1)==1) 
    last_bit=-last_bit;
    y(i*n+1:(i+1)*n)=last_bit;
  else
    y(i*n+1:(i+1)*n)=last_bit;
  end
end

plot(t, y, 'Linewidth', 3);
counter=0;
last_bit=1;
x=1;
for i=1:length(t)
  if(t(i)>counter)
  counter=counter+(1/bitrate);
    if(y(i)!=last_bit)
      result(x)=1;
      last_bit=-last_bit;
      x=x+1;
    else 
      result(x)=0;
      x=x+1;
    end
  end
end

disp('NRZ_I Line Decoding');
disp(result);
    
    

