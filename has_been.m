function [ A,flag ] = has_been( A,i,j,flag )
% this function checks if a maze, represented by the matrix A
% can be finished, from the starting point i,j. 
% it returns a flag to say if the maze was finished.
% it also receives a flag, because recursion is used. 

if j==length(A(1,:,1))  % if we are finishing now

    flag=1;
    A(i,j,5)=1;
else if flag==1 % if we finished earlier 
else if i <= length(A(:,1,1)) && i>=1 %not over the top or under the bottom
        if j<=length(A(1,:,1)) && j>=1 % not too much to the right or too much to the left
            if A(i,j,5)==0        %has been visited yet ? if not, then:
               A(i,j,5)=1;        % mark as visited
               %keep moving
               if A(i,j,2)==1         %move down
                   [A,flag]=has_been( A,i+1,j,flag );
               end
               if A(i,j,3)==1         %move right
                    [A,flag]=has_been( A,i,j+1,flag );
               end
               if A(i,j,1)==1        %move up
                    [A,flag]=has_been( A,i-1,j,flag );
               end
               if A(i,j,4)==1         %move left
                    [A,flag]=has_been( A,i,j-1,flag );
               end
            end
        end
    end
end
end
end




