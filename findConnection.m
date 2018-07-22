function [Row,Col,distanceColumns] = findConnection(distanceColumns,Current,rowStorage)

[distanceSortedRows, Col] = sort(distanceColumns,2); %Sort the distance matrix from smallest to biggest

currentMinimun = distanceSortedRows(size(distanceSortedRows,1),1);;
[allTimeMin,Row] = sort(distanceSortedRows(:,1));
if (currentMinimun <= allTimeMin(1))
    distanceColumns(size(distanceSortedRows,1),Col(size(Col,1),1)) = inf;
    Row = Current;
    Col = Col(size(Col,1),1);
else
    distanceColumns(Row(1),Col(Row(1))) = inf;
    Col = Col(Row(1),1);
    Row = rowStorage(Row(1));
end

end
