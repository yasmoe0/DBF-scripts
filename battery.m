clear
clc
close all
%=========================================
disp("-----------------------------------------")

bmah = input("Input Battery Capacity [mAh]= ");
bcell = input("Input Battery C [C]= ");
avgampout = input("Input Avg aircraft Amp draw [Ah]= ");

mah2amp = (bmah/1000);
avaconstamp = bcell*mah2amp;
t = (mah2amp/avgampout)*60;

disp("=========================================")
disp("Avaliable max Amp draw [Ah]= " + avaconstamp)
disp("Flight Time [m]= " + t)

if avaconstamp >avgampout
    disp("Supports max Amp draw!")
else
    disp("Does NOT supports max Amp draw!")
end
%=========================================



