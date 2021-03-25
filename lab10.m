% Computes utility bill based upon user-inputted electricity usage
% Rates and cutoffs
baselineRate = 0.12; %baseline rate
baselineCutoff = 200; %baseline threshold

tier2Rate = 0.14; % tier 2 rate
tier2Cutoff = 260; %tier 2 threshold

tier3Rate = 0.16; % tier 3 rate
tier3Cutoff = Inf; %tier 3 threshold

billingFee = 3.50; % base billing fee


kWh = input("Enter the kWh used in the last month: ");

if kWh < 0
    disp("Error: Your monthly amount is invalid.");
elseif kWh > 0 & kWh <= baselineCutoff
    amnt = billingFee;
    amnt = amnt + baselineRate*kWh;
    fprintf("Total Amount Due $%3.2f.\n", amnt);
elseif kWh > baselineCutoff & kWh <= tier2Cutoff
    amnt = billingFee;
    amnt = amnt + baselineRate*baselineCutoff;
    amnt = amnt + (kWh-baselineCutoff)*tier2Rate;
    fprintf("Total Amount Due $%3.2f.\n", amnt);
elseif kWh > tier2Cutoff & kWh <= tier3Cutoff
    amnt = billingFee;
    amnt = amnt + baselineRate*baselineCutoff + tier2Rate*(tier2Cutoff-baselineCutoff);
    amnt = amnt + (kWh-tier2Cutoff)*tier3Rate;
    fprintf("Total Amount Due $%3.2f.\n", amnt);
end