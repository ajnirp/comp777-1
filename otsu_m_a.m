function [ISeg, means, std_devs] = otsu_m_a(I_noise, scenario)

ISeg = zeros(200, 200);

min_I = min(min(I_noise));
max_I = max(max(I_noise));

min_e = 1e12;
means = [0 0];
std_devs = [25 25];
best_thresh = 0;

for thresh = min_I : max_I
    [energy, means_] = otsu_m_a_energy(I_noise, thresh, scenario);
    if energy < min_e
        min_e = energy;
        means = means_;
        best_thresh = thresh;
    end
end

bg_pixels = I_noise <= best_thresh;
fg_pixels = I_noise > best_thresh;
ISeg(bg_pixels) = means(1);
ISeg(fg_pixels) = means(2);

end