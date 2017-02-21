function [energy, means] = otsu_m_energy(I, thresh, ~)

bg = I(I <= thresh);
bg_diff = bg - mean(bg);
bg_energy = sum(bg_diff .* bg_diff);

fg = I(I > thresh);
fg_diff = fg - mean(fg);
fg_energy = sum(fg_diff .* fg_diff);

energy = bg_energy + fg_energy;
means = [mean(bg), mean(fg)];

end