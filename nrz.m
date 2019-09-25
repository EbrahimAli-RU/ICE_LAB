clear;

bits=[1 0 0 1 0 1 0 1 1 1 1 1];
BitRate=1;
T = length(bits)/BitRate;
n = 100;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
y = zeros(1,length(t));

%{

m=1/BitRate;
z=m;
x=1;
for i=1:length(t)
  y(i)=bits(x);
   if(t(i)>=z) 
   {  
      z=z+m;
      x=x+1;
   }
   end
end
%}
                                                                                                                                                
for i=0:length(bits)-1
  if bits(i+1)==1
    y(i*n+1:(i+1)*n) =1;
  else
    y(i*n+1:(i+1)*n) =0;
  end
end

plot(t,y);

counter=0;
for i=1:length(t);
  if (t(i)>counter)
    counter=counter+1;
    store(counter)=y(i);
  end
end

disp('NRZ unipoler decoding: ');
disp(store);


  
 
