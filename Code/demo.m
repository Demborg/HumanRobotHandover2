%% Import data form one of the files
[t, P] = importMarkerData('../RawData/AnneliBengtAA1.csv');

[g, r] = getEndEfectors(P);

 %Get the giver and reciever motions in 3 dimensions
 pG = P(:,[-2 -1 0]+3*g);
 pR = P(:,[-2 -1 0]+3*r);
 
 %%Plot the data in all 3 dimensions
 figure()
 hold on
 title('X')
 plot(t,pG(:,1),'g')
 plot(t,pR(:,1),'r')
 
 figure()
 hold on
 title('Y')
 plot(t,pG(:,2),'g')
 plot(t,pR(:,2),'r')
 
 figure()
 hold on
 title('Z')
 plot(t,pG(:,3),'g')
 plot(t,pR(:,3),'r')