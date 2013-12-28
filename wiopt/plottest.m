Thoughput=[9.6763   10.8278   12.8485   14.4480   14.3703   16.3846   13.6864   14.6072   20.5234   20.4835]
Nointerference= [12.5069   25.0050   36.4086   44.5423   51.0048   56.5649   61.1030   64.3430   66.9952   68.6851]
maxcurrent=[ 10.4553   22.9513   33.1100   43.6985]


figure
hold on
plot(Nointerference,'r')
plot(Thoughput)

plot(maxcurrent,'k*-')

title('Different Metric')
legend('No Interference','Max Approach','Max Current')