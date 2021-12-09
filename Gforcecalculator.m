%% G-Force

close all;
clear;
clc;
%=======================================================================
%% EQN and values

disp("* G-Force Calculator:")
gask = input("(1)Imperial units OR (2)Metric units? ");
if gask == 1
    g = 32.2;
    unitsPs = "[ft/s]";
    unitsP = "[ft]";
elseif gask == 2 
    g = 9.81;
    unitsPs = "[m/s]";
    unitsP = "[m]";
else 
    error("Invaild option " + gask);
end
mx = input("(1)Constant or (2)Iter ? ");

if mx == 1 
    mxs = input("Solve for (1)G, (2)V, or (3)R ? ");
    
        if mxs == 1 
           v = input("Object Velocity " + unitsPs + " = ");
           r = input("Turn radius " + unitsP + " = ");

           Gsolve = ((v^2)/r)/g;
           fprintf('G-Force = %4.5f',Gsolve)
           
        elseif mxs == 2
            G = input("G force [G] = ");
           r = input("Turn radius " + unitsP + " = ");

           Vsolve = sqrt(G*r*g);
           fprintf('Required velocity = %4.5f '+ unitsPs,Vsolve);

        elseif mxs == 3
           G = input("G force [G] = ");
           v = input("Object Velocity " + unitsPs + " = ");

           Rsolve = (v^2)/(G*g);
           fprintf('Required radius = %4.5f '+ unitsP,Rsolve);
        else
            error("Invaild option " + mxs);
        end
elseif mx == 2
    mxg = input ("(1)Constant G or (2)Multiple Gs = ");
    if mxg == 1
    G = input("Set the constant G-Force value = ");
    mxs = input("Solve for (1)V, or (2)R ? ");
    
        if mxs == 1
            Rmin = input("Input Minimum radius "+ unitsP + " = ");
            Rmax = input("Input Maximum radius "+ unitsP + " = ");
            r = [Rmin:0.1:Rmax];

            for i = Rmin:0.1:Rmax            
                vG = sqrt(r*G*g);
                vG45 = sqrt(r*4.5*g);
            end
            figure(1)
            plot(r,vG,r,vG45,'--r');
            title('Velocity Vs Radius')
            xlabel('Radius '+unitsP)
            ylabel('Velocity '+unitsPs)
            legend('Given G','4.5 G')

        elseif mxs == 2
            Vmin = input("Input Minimum velocity "+ unitsPs + " = ");
            Vmax = input("Input Maximum velocity "+ unitsPs + " = ");
            v = [Vmin:0.1:Vmax];
            for i = Vmin:0.1:Vmax           
                rG = (v.^2)/(G*g);    
                rG45 = (v.^2)/(4.5*g); 
            end
            figure(2)
            plot(rG,v,rG45,v,'--r');
            title('Velocity Vs Radius')
            xlabel('Radius '+unitsP)
            ylabel('Velocity '+unitsPs)
            legend('Given G','4.5 G')

        else
            error("Invaild option " + mxs);
        end
    elseif mxg == 2
        disp("G's = [1,2,3,4]");
        mxs = input("Solve for (1)V, or (2)R ? ");
    
        if mxs == 1
            Rmin = input("Input Minimum radius "+ unitsP + " = ");
            Rmax = input("Input Maximum radius "+ unitsP + " = ");
            r = [Rmin:0.1:Rmax];

            for i = Rmin:0.1:Rmax            
                vG1 = sqrt(r*1*g);
                vG2 = sqrt(r*2*g);
                vG3 = sqrt(r*3*g);
                vG4 = sqrt(r*4*g);
                vG45 = sqrt(r*4.5*g);
            end
            figure(1)
            plot(r,vG1,r,vG2,r,vG3,r,vG4,r,vG45,'--r');
            title('Velocity Vs Radius')
            xlabel('Radius '+unitsP)
            ylabel('Velocity '+unitsPs)
            legend('1G','2G','3G','4G','4.5G')

        elseif mxs == 2
            Vmin = input("Input Minimum velocity "+ unitsPs + " = ");
            Vmax = input("Input Maximum velocity "+ unitsPs + " = ");
            v = [Vmin:0.1:Vmax];
            for i = Vmin:0.1:Vmax           
                rG1 = (v.^2)/(1*g);
                rG2 = (v.^2)/(2*g); 
                rG3 = (v.^2)/(3*g); 
                rG4 = (v.^2)/(4*g); 
                rG45 = (v.^2)/(4.5*g);
            end
            figure(2)
            plot(rG1,v,rG2,v,rG3,v,rG4,v,rG45,v,'--r');
            title('Velocity Vs Radius')
            xlabel('Radius '+unitsP)
            ylabel('Velocity '+unitsPs)
            legend('1G','2G','3G','4G','4.5G')
        else
            error("Invaild option " + mxs);
        end

    else 
        error("Invaild option " + mxg);
    end

else
    error("Invaild option " + mx);
end