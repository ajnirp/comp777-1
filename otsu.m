function [ISeg, means, std_devs] = otsu(I_noise, method, scenario)

switch method
    case 1
        [ISeg, means, std_devs] = otsu_m(I_noise, scenario);
    case 2
        [ISeg, means, std_devs] = otsu_ms(I_noise, scenario);
    case 3
        [ISeg, means, std_devs] = otsu_m_a(I_noise, scenario);
    case 4
        [ISeg, means, std_devs] = otsu_ms_a(I_noise, scenario);
end

end