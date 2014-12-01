clc;
clear all;
close all;

x_start = 2.*[1 1 1 1 1 0 0 1 1 0 1 0 1] - 1;

x = 2.*randi([0 1],1,25) - 1;
noise = 2.*randi([0 1],1,10) - 1;

received_signal = [noise x_start x];

figure
plot(abs(xcorr(x_start,received_signal)))

[test_value,index] = max(abs(xcorr(x_start,received_signal)));

index
start_index = length(received_signal) - index + length(x_start)

error = sum(abs(received_signal(start_index + 1:end) - x))

figure
plot(abs(xcorr(received_signal,received_signal)))

test = abs(xcorr(received_signal,received_signal));

x = 1;
i = 1;
for i = 1:length(test)
    if (test(i) > 10)
        x = 0;
        index = i;
    end
end

index