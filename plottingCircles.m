function [] = plottingCircles(termStorage,numNodes,numHarmonics)

set(0,'defaultFigureColor',[1 1 1]);
clear all; clc;

addpath([pwd '\ds2nfu']);

isVideOn = 0;      % To control whether to dump jpeg snapshots or not. 0: do not dump 1: dump jpegs

Np = 220;            % Number of spatial points
dx = 2*pi/Np;        % discretization size
x  = 0:dx:(6*pi);    % utilized x range


end