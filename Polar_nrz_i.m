close all;
clea all;
n=[1,0,1,0,1,0,0,1];
x=input('Voltage level : ');

c=0;
z=3;

for k=1:length(n)
    if n(k)==1
        if mod(c,2)==0
            nn(k)=3;
            z=3;
            c=c+1;
        else
            nn(k)=-3;
            z=-3;
            c=c+1;
        end
       
    else
        nn(k)=z;
        
    end
end

i=1;
t =0:0.001:length(nn);
for j=1:length(t)
    if t(j)<=i;
        y(j)=nn(i);
    else 
        y(j)=nn(i);
        i=i+1;
    end
end


plot(t,y);
axis([0 length(n) -(x+3) (x+3)]);
