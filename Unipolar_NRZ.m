bits = [1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0];


i1=1;
t=0:0.001:length(bits);
for j=1:length(t)
    if t(j)<=i1
        y(j)=nn(t1);
    else
        y(j)=nn(t1);
        i1=i1+1;
    end
end

plot(t,y,'r-');
        
        