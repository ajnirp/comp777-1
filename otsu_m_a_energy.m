function [energy, means, std_devs] = otsu_m_a_energy(I, thresh, scenario)

mu_afg = 100;
mu_abg = 100;
if scenario > 2
    mu_afg = 10;
    mu_abg = 190;
end

sig_afg = 100;
sig_abg = 100;

bg = I(I <= thresh);
d = bg - mean(bg);
bg_std = std(bg, 1);
bg_energy = sum(d.*d)/(2*bg_std*bg_std);

fg = I(I > thresh);
d = fg - mean(fg);
fg_std = std(fg, 1);
fg_energy = sum(d.*d)/(2*fg_std*fg_std);

% Priors on the sizes of the foreground and background
afg_d = (length(fg) - mu_afg);
afg_energy = (afg_d.*afg_d)/(2*sig_afg*sig_afg);
abg_d = (length(bg) - mu_abg);
abg_energy = (abg_d.*abg_d)/(2*sig_abg*sig_abg);

energy = bg_energy + fg_energy + afg_energy + abg_energy;
means = [mean(bg), mean(fg)];
std_devs = [bg_std, fg_std];

end