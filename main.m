%% Initialization

num_scenarios = 4;
num_methods = 4;
num_runs = 25;

overlap = zeros(num_scenarios, num_methods, num_runs); % scenario, method, run

%% Run all scenarios and methods

for scenario = 1 : num_scenarios % 1 : 4
    display(sprintf('Scenario %d', scenario));
    for run = 1 : num_runs % 1 : 25
        display(sprintf('run %i', run));
        for method = 1 : num_methods % 1 : 4
            display(sprintf('method %i', method));
            [I_noise,I,ISeg,means,stds,prop] = getImages(scenario);
            [ISeg_, means_, std_devs_] = otsu(I_noise, method, scenario);
            overlap(scenario, method, run) = dice(ISeg, ISeg_);
        end
    end
end

%% Plot the data

figure_num = 1;
figure('Name','Otsu Thresholding','units','normalized','outerposition',[0 0 1 1]);
for scenario = 1 : num_scenarios
    for method = 1 : num_methods
        data = overlap(scenario, method, :);
        data = reshape(data, [num_runs 1]);
        x_axis = run * ones([num_runs 1]);
        subplot(num_scenarios, num_methods, figure_num);
        boxplot(data, x_axis);
        title(sprintf('Scenario %d, Method %d', scenario, method));
        figure_num = figure_num + 1;
    end
end
saveas(gcf, 'Results.png');

%% Random testing

[I_noise,I,ISeg,means,stds,prop] = getImages(scenario);
[ISeg_, means_, std_devs_] = otsu(I_noise, method, scenario);
overlap_ = dice(ISeg, ISeg_);
