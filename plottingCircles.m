function [] = plottingCircles(termStorage,fourierCoefficentList,numNodes,numHarmonics)

for i = 1:size(fourierCoefficentList,2)
    
    plotCircle(0,0,fourierCoefficentList(i));
    
end
end