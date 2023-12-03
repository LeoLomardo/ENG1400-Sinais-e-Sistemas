clc
clear 
close all

% Sinal f1(t)
t1 = linspace(0, 1, 1000); 
k_values = [10, 50, 100, 500, 1000];
f1_t = sum(sin(k_values.' * pi * t1));

% Sinal 2: f2(t)
t2 = linspace(0, 6, 6000);
f2_t = zeros(size(t2));

for i = 1:length(t2)
    if t2(i) < 2
        f2_t(i) = 5 * t2(i);
    elseif t2(i) >= 2 && t2(i) <= 4
        f2_t(i) = 10;
    elseif t2(i) > 4 && t2(i) <= 5
        f2_t(i) = -10 * (t2(i) - 4);
    else
        f2_t(i) = 0;
    end
end

% Sinal f3(t)
t3 = linspace(0, 0.002, 1000);
f3_t = zeros(size(t3));

for i = 1:length(t3)
    if t3(i) < 1e-3
        f3_t(i) = 7.5;
    elseif t3(i) >= 1e-3 && t3(i) < 2e-3
        f3_t(i) = 2.5;
    end
end

% Plotagem dos sinais no domínio do tempo
figure(1);
subplot(3, 1, 1);
plot(t1, f1_t);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal f1(t)');

subplot(3, 1, 2);
plot(t2, f2_t);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal f2(t)');
ylim([-12, 14]);

subplot(3, 1, 3);
plot(t3, f3_t);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal f3(t)');
ylim([0, 10]);

% Transformada de Fourier dos Sinais 
f1_freq = fft(f1_t);
f2_freq = fft(f2_t);
f3_freq = fft(f3_t);

% Frequência Correspondente
freq1 = fftshift(linspace(-1/(2*(t1(2)-t1(1))), 1/(2*(t1(2)-t1(1))), length(t1))); 
freq2 = fftshift(linspace(-1/(2*(t2(2)-t2(1))), 1/(2*(t2(2)-t2(1))), length(t2)));
freq3 = fftshift(linspace(-1/(2*(t3(2)-t3(1))), 1/(2*(t3(2)-t3(1))), length(t3)));

% Subplots para as transformadas de Fourier
figure(2);

% Transformada de Fourier de f1(t)
subplot(2, 1, 1);
plot(freq1, abs(fftshift(f1_freq)));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Transformada de Fourier de f1(t)');
xlim([-600, 600]);
ylim([0, 100]);
% Transformada de Fourier de f2(t)
subplot(2, 1, 2);
plot(freq2, abs(f2_freq));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
%title('Transformada de Fourier de f2(t)');
xlim([-60, 60]);
ylim([0, 10000]);

figure(3);
% Transformada de Fourier de f3(t)
subplot(2, 1, 1);
plot(freq3, abs(f3_freq));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
%title('Transformada de Fourier de f3(t)');
xlim([-25000, 25000]);
ylim([0, 3000]);

%energia dos sinais 
EnergiaF1 = ((t1(2)-t1(1))/1) * sum(abs(f1_t).^2);
EnergiaF2 = ((t2(2)-t2(1))/6) * sum(abs(f2_t).^2); 
EnergiaF3 = ((t3(2)-t3(1))/0.002) * sum(abs(f3_t).^2);  

f1_freq(abs(freq1)<10) = 0;
f2_freq(abs(freq2)<10) = 0;
f3_freq(abs(freq3)<10) = 0;

f1mod = ifft(f1_freq);
f2mod = ifft(f2_freq);
f3mod = ifft(f3_freq);

figure(4);
subplot(3, 1, 1);
plot(t1, real(f1mod));
xlabel('Tempo (s)');
ylabel('Amplitude');


subplot(3, 1, 2);
plot(t2, real(f2mod));
xlabel('Tempo (s)');
ylabel('Amplitude');
ylim([-12, 14]);

subplot(3, 1, 3);
plot(t3, real(f3mod));
xlabel('Tempo (s)');
ylabel('Amplitude');
ylim([0, 10]);


%Energia dos Sinais Modificado

EnergiaF1_mod = sum(abs(f1mod).^2) * (t1(2) - t1(1) /1);
EnergiaF2_mod = sum(abs(f2mod).^2) * (t2(2) - t2(1) /6);
EnergiaF3_mod = sum(abs(f3mod).^2) * (t3(2) - t3(1) /0.002); 


disp(['Energia  F1: ' num2str(EnergiaF1)]);
disp(['Energia  F2: ' num2str(EnergiaF2)]);
disp(['Energia  F3: ' num2str(EnergiaF3)]);

disp(['Energia Modificada F1: ' num2str(EnergiaF1_mod)]);
disp(['Energia Modificada F2: ' num2str(EnergiaF2_mod)]);
disp(['Energia Modificada F3: ' num2str(EnergiaF3_mod)]);
