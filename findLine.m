function [line, connections] = findLine(connections, line,row,col,prev)


line = [line, connections(row,col)];

if (col == 1)
    temp = connections(row,col);
    connections(row,col) = inf;
    line = [line, connections(row,col+1)];
    %line = [line, findLine(connections, line, row, col+1)]
%elseif (col == 2)
end
while (ismember(connections(row,2),connections(:,1)) == 1)
    nextRow = min(find(connections(:,1) == connections(row,2)));
    temp2 = connections(nextRow,1);
    connections(nextRow,1) = inf;
    [x,connections] = findLine(connections, [], nextRow, 2, temp2);
    line = [line, x];
end
line = [line, prev];
%end
end 