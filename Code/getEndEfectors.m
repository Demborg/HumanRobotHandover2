function [ indexGiver, indexReciever ] = getEndEfectors( P )
% Takes a matrix of the form  [X1,Y1,Z1,X1,Y1,Z1...;X2,Y2,Z2,..] describing
% two humans in a specific position and tries to find the index of their 
% right hands. it return the index of the first coordinate (X) for each of
% the endeffectors R hand 1 and 2 

%P = P(~isnan(P));

atT0 = P(1,:);
atT0 = reshape(atT0,3,numel(atT0)/3);
X = atT0(1,:);
Y = atT0(2,:);
Z = atT0(3,:);

% hitta mitten mellan två personerna
middle = nanmean(X(X<-0.4));

%figure
%plot(sum(isnan(P),2)/3)

%means = nanmean(P);


vals = nansum(abs(diff(P)));


rs = vals(1:3:end).^2+vals(2:3:end).^2+vals(3:3:end).^2;
[~, i] = sort(rs,'descend');
%plot(vals,'*')

giverIndexes = (X>middle);
giverIndexes = giverIndexes(i);
giverIndexes = i(giverIndexes);
indexGiver = giverIndexes(1);

recieverIndexes = (X<middle);
recieverIndexes = recieverIndexes(i);
recieverIndexes = i(recieverIndexes);
indexReciever = recieverIndexes(1);
% 
% figure('name','endeffectors')
% hold on
% plot3(Z,X,Y,'k*')
% scatter3(Z(indexGiver),X(indexGiver),Y(indexGiver),'g')
% scatter3(Z(indexReciever),X(indexReciever),Y(indexReciever),'r')

end

