function [energy, means, std_devs] = otsu_ms_energy(I, thresh, ~)

bg = I(I <= thresh);
d = bg - mean(bg);
bg_sd = std(bg, 1);
bg_energy = length(bg)*log(bg_sd) + sum(d.*d)/(bg_sd^2);

fg = I(I > thresh);
d = fg - mean(fg);
fg_sd = std(fg, 1);
fg_energy = length(fg)*log(fg_sd) + sum(d.*d)/(fg_sd^2);

energy = bg_energy + fg_energy;
means = [mean(bg), mean(fg)];
std_devs = [bg_sd, fg_sd];

end