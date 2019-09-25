bits=[1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]

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
    if(count==8)
       y((i-8)*n+1:(i-7)*n)=0;
       y((i-7)*n+1:(i-6)*n)=0;
       y((i-6)*n+1:(i-5)*n)=0;
       y((i-5)*n+1:(i-4)*n)=lastbit;
       y((i-4)*n+1:(i-3)*n)=-lastbit;
       y((i-3)*n+1:(i-2)*n)=0;
       y((i-2)*n+1:(i-1)*n)=-lastbit;
       y((i-1)*n+1:i*n)=lastbit;
       count=0;
    end
  else
    y((i-1)*n+1:i*n)=-lastbit;
    lastbit=-lastbit;
    count=0;
  end
end

plot(t,y,'Linewidth',3);

counter=0;
x=0;
z=0;
lastbit=1;
for i=1:length(t)
  if(t(i)>counter)
    counter=counter+(1/bitrate);
    x=x+1;
    if(y(i-1)==lastbit)
      result(x-3:x)=0;
      z=1;
      
    else 
      if(y(i)==0) 
        result(x)=0;
      else 
        if(z==1) result(x)=0; z=0;lastbit=-lastbit;
        else
          result(x)=1;
          lastbit=-lastbit;
        end
      end
    end
  end
end

 
disp(result);