
%LOADING IMAGE
Image = imread('Image.jpg');  %Load in image
BWImage = rgb2gray(Image);  %Convert Image to black and white


%Finding LINES
Edges = edge(BWImage, 'Canny', 0.35); %Find the lines of the image
%imshow(Edges);                       %Show edges to determine if the right lines have been found


%ORDERING POINTS
testEdges = [1 0 0 0 1;0 1 0 1 0;0 0 1 0 0;0 1 0 1 0;1 0 0 0 1];
[row,col] = find(testEdges);     %Find the co-ordinates of all non-zero points
distanceRowsV = pdist(row);  %Calculate the distance between the nodes row wise
distanceColsV = pdist(col);  %Calculate the distance between the nodes column wise
distanceRowsM = squareform(distanceRowsV); %Finds the sqaure distance matrix for rows
distanceColsM = squareform(distanceColsV); %Finds the sqaure distance matrix for cols
finalDistance = sqrt(distanceRowsM.^2 + distanceColsM.^2); %Find the sqaure distance matrix for nodes
numberOfNodes = size(finalDistance,1); %Find out how many nodes
finalDistance(1:numberOfNodes+1:numberOfNodes^2) = inf;        %Set Diagonal zeros to 0 (Don't care about distance from a node to itself)

%testing code
i = 1;
nodesFound = 0;
tempDistances = finalDistance(1,:);
Next = 1;
Current = 1;
Connections = [0,0];
rowStorage = 1;
while (nodesFound ~= numberOfNodes)
    [Current,Next,tempDistances] = findConnection(tempDistances,Next,rowStorage);
    rowStorage = [rowStorage;Next];
    Connections(i,:) = [Current,Next];
    %tempDistances(size(tempDistances,1),Next) = inf;
    finalDistance(Next,Current) = inf;
    tempDistances = [tempDistances;finalDistance(Next,:)];
    if (i ~= 1) %Unique works differently for an array rather than matrix. Since no picture will have only 2 nodes we can ignore it
        uniqueConnections = unique(Connections);
        nodesFound = size(uniqueConnections,1);
    end
    i = i + 1;
end





%Drawing shit
% tempRows = row;
% tempCols = col;
% for m = 1:numberOfNodes
%    row(m) = tempRows(temp(m));
%    col(m) = tempCols(temp(m));
% end

% positions = col + 1j*row;
% numHarmonics = numberOfNodes/2;
% termStorage = zeros(numberOfNodes,numberOfNodes);
% for t = 1:numHarmonics
%     if (t ~= 0)
%         fourierCoefficent = (1/numberOfNodes)*(exp(-1j*2*pi*t*(1:numberOfNodes)/numberOfNodes) * positions);
%         fourierTerm = fourierCoefficent*exp(1j*2*pi*t*(1:numberOfNodes)/numberOfNodes);
%         termStorage(t,:) = fourierTerm; 
%     end
% end

