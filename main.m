overlap = zeros(4,4,25); % scenario, method, run

for scenario = 4 : 4
    display(sprintf('Scenario %d', scenario));
    for run = 1 : 25
        display(sprintf('run %i', run));
        for method = 1 : 4 % TODO: this should be 1 : 4
            display(sprintf('method %i', method));
            [I_noise,I,ISeg,means,stds,prop] = getImages(1);
            [I_, ISeg_, means_, std_devs_] = otsu(I_noise, method, scenario);
            overlap(scenario, method, run) = dice(ISeg, ISeg_);
        end
    end
end