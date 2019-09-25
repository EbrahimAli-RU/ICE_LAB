bits=[1 0 0 0 1 0 0 0 0 1 1 0 1 0];

bitrate=1;
T=length(bits)/bitrate;
n=100;
N=n*length(bits);
dt=T/N;
t=0:dt:T;
y=zeros(1,length(t));
lastbit=1;

count=0;
pulse=0;
for i=1:length(bits)
  if(bits(i)==0)
    count=count+1;
    if(count==4)
      if (mod(pulse,2)==0)
        lastbit=-lastbit;
        y((i-4)*n+1:(i-3)*n)=lastbit;
        y((i-3)*n+1:(i-2)*n)=0;
        y((i-2)*n+1:(i-1)*n)=0;
        y((i-1)*n+1:i*n)=lastbit;
        
      else
        y((i-4)*n+1:(i-3)*n)=0;
        y((i-3)*n+1:(i-2)*n)=0;
        y((i-2)*n+1:(i-1)*n)=0;
        y((i-1)*n+1:i*n)=-lastbit;
        pulse=pulse+1;
      end
      count=0;
    end
  else
    count=0;
    y((i-1)*n+1:i*n)=-lastbit;
    lastbit=-lastbit;
    pulse=pulse+1;
  end
end

plot(t,y,'Linewidth',3);

counter=0;
x=0;
lastbit=1;
for i=1:length(t)
  if(t(i)>counter)
    counter=counter+(1/bitrate);
    x=x+1;
    if(y(i)==lastbit )
      result(x-3:x)=0;
    else 
      if(y(i)==0) 
        result(x)=0;
      else
        result(x)=1;
        lastbit=-lastbit;
      end
    end
  end
end


disp(result);
