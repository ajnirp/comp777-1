function [I, ISeg, means, std_devs] = otsu_m_a(I_noise, scenario)

I = zeros(200, 200);

min_I = min(min(I_noise));
max_I = max(max(I_noise));

min_e = 1e12;
means = [0 0];
std_devs = [0 0];

for thresh = min_I : max_I
    [energy, means_, std_devs_] = otsu_m_a_energy(I_noise, thresh, scenario);
    if energy < min_e
        min_e = energy;
        means = means_;
        std_devs = std_devs_;
    end
end

I(1:100, :) = means(1);
I(101:end, :) = means(2);
ISeg = I > means(1);

end