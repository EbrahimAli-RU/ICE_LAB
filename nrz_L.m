bits=[1 0 1 1 0 1 1 0 0 1];
bitrate=1;
n=100;
N=n*length(bits);
T=length(bits)/bitrate;
dt=T/N;
t=0:dt:T;
y=zeros(1,length(t));

positive=1;
negative=-1;

for i=0:length(bits)-1
  if(bits(i+1)==1)
    y(i*n+1:(i+1)*n)=negative;
  else
    y(i*n+1:(i+1)*n)=positive;
  end
end


plot(t,y,'Linewidth',3);

counter=0;
x=1;
for i=1:length(t)
  if(t(i)>counter)
    counter=counter+(1/bitrate);
    if(y(i)==positive)
      result(x)=0;
      x=x+1;
    else 
      result(x)=1; 
      x=x+1;
    end
  end
end


disp(result);
  