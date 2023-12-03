clc
clear 
close all

% Definindo a frequência angular ω
omega = logspace(0, 3, 1000); % Frequência angular varia de 1 a 1000 rad/s

% Defina a função de transferência H(jω)
H = 16 ./ (-omega.^2 + 10j.*omega + 16);

magnitude_H = abs(H);
fase_H = angle(H);


% Gráfico de Bode do módulo
figure;
semilogx(omega, 20 * log10(magnitude_H));
xlabel('Frequência (rad/s)');
ylabel('Módulo (dB)');
title('');
grid on;
% Gráfico de Bode da fase
figure;
semilogx(omega, rad2deg(fase_H));
xlabel('Frequência (rad/s)');
ylabel('Fase (graus)');
title('');
grid on;