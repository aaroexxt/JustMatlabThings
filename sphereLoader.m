T = readtable("sphere.dat")
SRadius = T.Var1_1
SVRsphere = T.Var1_4

plot(SRadius, SVRsphere)
title("Radius (m) vs Surface to Volume Ratio")
xlabel("Radius (m)")
ylabel("Surface to Volume Ratio")