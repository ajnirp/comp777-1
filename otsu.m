function [I, ISeg, means, std_devs] = otsu(I_noise, method, scenario)

switch method
    case 1
        [I, ISeg, means, std_devs] = otsu_m(I_noise, scenario);
    case 2
        [I, ISeg, means, std_devs] = otsu_ms(I_noise, scenario);
    case 3
        [I, ISeg, means, std_devs] = otsu_m_a(I_noise, scenario);
    case 4
        [I, ISeg, means, std_devs] = otsu_ms_a(I_noise, scenario);
end

end