%Carson Williams
%Week 8 Final

close all
clear all

% Building time series
week = 0:0.5:604800; % Seconds in a week (604800)

% Sine curves
wave1 = 0.5*sin((2*pi/10)*week);
wave2 = 0.25*sin((2*pi/200)*week);
wave3 = 1.5*sin((2*pi/45000)*week);
wave_combined = wave1 + wave2 + wave3; 
noise = wave_combined + (0.1*sin(randn(size(wave_combined)))); 

% Plots
figure(1)
subplot(4,1,1)
plot(week,noise)
xlim([0 1.35*10^5])
ylim([-2.5 2.5])

% subplots
grid on
title('Combined Noise Wave Signal')
xlabel('Time (seconds)')
ylabel('Displacement (meters)')
set(gcf, 'Position', get(0, 'Screensize'));
Freq1 = 1/10;
Freq2 = 1/200;
Freq3 = 1/45000;

% Wn Values
Wn1 = [0.075 0.125]; % Wave frequency Wn value = 0.1 Hz / 2 = 0.05 so [0.075 0.125]
Wn2 = [0.0025 0.0075]; % Infragravity wave Wn value = 0.005 Hz / 2 = 0.0025 so [0.0025 0.0075]
Wn3 = 4*10^-5; %Tides Wn value = (1/45000)/2 = 1.1 x 10^-5; played with Wn values

% 
[b,a] = butter(3,Wn1); % creating the filter coefficients with butterworth function
yfilt=filtfilt(b,a,noise); % function actually does the filtering
subplot(4,1,2)
hold on
plot(week,yfilt,'b'); % plotting of the filtered wave
xlim([0 30]) % Setting limits to improve resolution
ylim([-0.6 0.6]) % Setting limits to improve resolution

% subplots
title('Waves Signal')
xlabel('Time (seconds)')
ylabel('Displacement (meters)')

% Filtering out all except Infragravity Waves
[b,a] = butter(3,Wn2); % creating the filter coefficients with butterworth function
yfilt=filtfilt(b,a,noise); % function actually does the filtering
subplot(4,1,3)
plot(week,yfilt,'b'); % plotting of the filtered wave
xlim([0 600]) % Setting limits to improve resolution
ylim([-0.3 0.3]) % Setting Limits to improve resolution

% subplot formating
title('Infragravity Waves Signal')
xlabel('Time (seconds)')
ylabel('Displacement (meters)')

% Filtering out all except Tides
[b,a] = butter(3,Wn3,'low'); % creating the filter coefficients with butterworth function
yfilt=filtfilt(b,a,noise); % function actually does the filtering
subplot(4,1,4)
plot(week,yfilt,'b'); % plotting of the filtered wave
xlim([0 13.5*10^4]); % Setting limits to improve resolution
ylim([-2 2]); % Setting limits to improve resolution

% subplot formating
title('Tides Signal')
xlabel('Time (seconds)')
ylabel('Displacement (meters)')