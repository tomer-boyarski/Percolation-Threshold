function flag = yesorno(p,n)
% this function checks if we can finish the maze 
% with a given p (chance of bridge existing)
% and a given n (size of maze)
% it returns 'yes or no' - therefore its name is yesorno

%we start with creating the maze
% n is the number of rows
% m is the number of columns
% for now, we assume a square maze:
m=n;
% each site of the maze has 5 number
% the 1st number says whether the bond going up exists
% the 2st number says whether the bond going down exists
% the 3st number says whether the bond going to the right exists
% the 4st number says whether the bond going to the left exists
% the 5st number says whether we've already been to this location
A=zeros(n,m,5);
%everyone can move up except the top 
A(2:n,:,1)=binornd(1,p,n-1,m,1); 
%everyone can move down except the bottom
A(1:n-1,:,2)=binornd(1,p,n-1,m,1);
%everyone can move right except the right-most
A(:,1:m-1,3)=binornd(1,p,n,m-1,1);
%everyone can move left except the left-most
A(:,2:m,4)=binornd(1,p,n,m-1,1);

i=1;% i is a counter
% the flag says if we've finished the journey already
flag=0;
% we check the ability to finish the maze with different
% starting points on the left size
while flag==0 && i<=m
[A,flag]=has_been(A,i,1,0);
i=i+1;
end