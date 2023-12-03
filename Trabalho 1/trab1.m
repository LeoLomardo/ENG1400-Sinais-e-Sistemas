clc
clear
close all

num = [10, -9, 0];
den = [1, -0.8, -0.25, 0.2];
H = tf(num, den);
poles = roots(den);
zeus = roots(num);

syms z;
% Coeficientes da função de transferência
G = (10*z*(z-0.9))/(z^3-0.8*z^2-0.25*z+0.2);
% Calcule a transformada Z inversa da função de transferência H(z)
 % Defina as variáveis simbólicas z 
inv_H = iztrans(G, z);

% Imprima a transformada Z inversa
disp('Transformada Z inversa de H(z):');
disp(inv_H);
%Calculo inv_H para z = 0
inv_H_at_z_0 = subs(inv_H, z, 0);
%Calculo inv_H para z = 5
inv_H_at_z_5 = subs(inv_H, z, 5);
% Imprima o resultado
disp('Transformada Z inversa de H(z) com z = 0:');
disp(inv_H_at_z_0);
% Imprima o resultado
disp('Transformada Z inversa de H(z) com z = 5:');
disp(inv_H_at_z_5);
%Definindo funcao degrau unitario%
n = -25:50;
u = zeros(size(n));% inicializa u(n) com zeros%
u(n>=0) = 1; %u(n) = 1, pra todo n>=0%

figure;
pzmap(H);
grid on;
title('');
axis([-1.2, 1.2, -1.2, 1.2]); % Define limites da janela de plotagem
hold on; % Mantém o gráfico ativo para personalizações

% Cores para polos e zeros
plot(real(pole(H)), imag(pole(H)), 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Polos em vermelho 'x'
plot(real(zero(H)), imag(zero(H)), 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Zeros em azul 'o'

legend('Zeros', 'Polos');
hold off; % Conclui o gráfico personalizado

fmt=['Polos =[' repmat(' %0.3f ',1,numel(poles)) ']\n'];
fprintf(fmt,poles);
fmt=['Zeros =[' repmat(' %0.3f ',1,numel(poles)) ']\n'];
fprintf(fmt,zeus);
fprintf("\n");


%Casualidade do Sistema%
isCausal = all(abs(roots(den)) < 1);
if isCausal
    disp('O sistema e causal.');
else
    disp('O sistema nao e causal.');
end

%Estabilidade do Sistema%
isStable = all(abs(roots(den)) < 0);
if isStable
    disp('O sistema é estável.');
else
    disp('O sistema não é estável.');
end

%Resposta Imulsional do Sistema%
% Verifique a parte real dos polos
for i = 1:length(poles)
    if real(poles(i)) >= 0
        disp(['O polo ', num2str(i), ' tem parte real não negativa, indicando atraso.']);
    end
end
hasDelay = any(abs(roots(num)) >=0);
if hasDelay
    disp('A resposta impulsional do sistema tem atraso.');
else
    disp('A resposta impulsional do sistema nao tem atraso.');
end

%Impulso Unitario%

x1 = [1; zeros(75,1)];
y1 = lsim(H, x1, n);

figure;
subplot(2, 1, 1);
stem(n, x1, 'filled');
%title('Impulso Unitario');


subplot(2, 1, 2);
stem(n, y1, 'filled');
%title('Resposta do Sistema ao Impulso Unitario');


%Degrau Unitario%
x2 = u;
y2 = lsim(H, x2, n);
figure;
subplot(2, 1, 1);
stem(n, x2, 'filled');
%title('Degrau Unitario');


subplot(2, 1, 2);
stem(n, y2, 'filled');
%title('Resposta do Sistema ao Degrau Unitario');


%Trem de Impulso%
x3 = [2; 3; -5; 4; -1; zeros(71, 1)]; % Transforme o vetor em uma matriz coluna%
y3 = lsim(H, x3, n);

figure;
subplot(2, 1, 1);
stem(n, x3, 'filled');
%title('Trem de Impulsos');

subplot(2, 1, 2);
stem(n, y3, 'filled');
%title('Resposta do Sistema ao Trem de Impulsos');


%x4 [n] = cos(3n) u[n]%
x4 = cos(3 * n) .* u;  % cos(3n) multiplicado por u[n]%
y4 = lsim(H, x4, n);

figure;
subplot(2, 1, 1);
stem(n, x4, 'filled');
%title('x4[n] = cos(3n) * u[n]');

subplot(2, 1, 2);
stem(n, y4, 'filled');
%title('Resposta do Sistema a x4[n]');



