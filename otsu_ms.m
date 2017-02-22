function [ISeg, means, std_devs] = otsu_ms(I_noise, scenario)

ISeg = zeros(200, 200);

min_I = min(min(I_noise));
max_I = max(max(I_noise));

min_e = 1e12;
means = [0 0];
std_devs = [0 0];
best_thresh = 0;

for thresh = min_I : max_I
    [energy, means_, std_devs_] = otsu_ms_energy(I_noise, thresh, scenario);
    if energy < min_e
        min_e = energy;
        means = means_;
        std_devs = std_devs_;
        best_thresh = thresh;
    end
end

bg_pixels = I_noise <= best_thresh;
fg_pixels = I_noise > best_thresh;
ISeg(bg_pixels) = means(1);
ISeg(fg_pixels) = means(2);

end