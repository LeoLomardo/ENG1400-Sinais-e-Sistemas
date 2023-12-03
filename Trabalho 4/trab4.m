limite_tempo = [0, 40];
clc
clear 
close all


filename = '/MATLAB Drive/Trabalho4/dont-stop-me-abstract-future-bass-162753.wav';
[x, Fs] = audioread(filename);
t_F = (0:length(x)-1) / Fs;
originalInfo = dir(filename);
disp('Informacoes sobre o arquivo original:');
disp(['Tamanho do arquivo original: ' num2str(originalInfo.bytes/1e6) ' MB']); 
disp(['Taxa de amostragem original: ' num2str(Fs) ' Hz']);
Fs_2F = 2 * Fs;
x_2F = resample(x, Fs_2F, Fs, 0, 0); 
outputFilename_2F = '/MATLAB Drive/Trabalho4/DontStopMe_amostragem_2F.wav';
audiowrite(outputFilename_2F, x_2F, Fs_2F);
info_2F = dir(outputFilename_2F);
disp('Informacoes sobre o arquivo amostrado em 2F:');
disp(['Tamanho do arquivo amostrado em 2F: ' num2str(info_2F.bytes/1e6) ' MB']);
disp(['Taxa de amostragem amostrada em 2F: ' num2str(Fs_2F) ' Hz']);
Fs_8F = 8 * Fs;
x_8F = resample(x, Fs_8F, Fs, 0, 0);
outputFilename_8F = '/MATLAB Drive/Trabalho4/DontStopMe_amostragem_8F.wav';
audiowrite(outputFilename_8F, x_8F, Fs_8F);
info_8F = dir(outputFilename_8F);
disp('Informacoes sobre o arquivo amostrado em 8F:');
disp(['Tamanho do arquivo amostrado em 8F: ' num2str(info_8F.bytes/1e6) ' MB']);
disp(['Taxa de amostragem amostrada em 8F: ' num2str(Fs_8F) ' Hz']);
Fs_1_5F =  Fs/5;
x_1_5F = resample(x, Fs_1_5F, Fs, 0, 0);
outputFilename_1_5F = '/MATLAB Drive/Trabalho4/DontStopMe_amostragem_1_5F.wav';
audiowrite(outputFilename_1_5F, x_1_5F, Fs_1_5F);
info_1_5F = dir(outputFilename_1_5F);
disp('Informacoes sobre o arquivo amostrado em F/5:');
disp(['Tamanho do arquivo amostrado em F/5: ' num2str(info_1_5F.bytes/1e6) ' MB']);
disp(['Taxa de amostragem amostrada em F/5: ' num2str(Fs_1_5F) ' Hz']);
Fs_1_20F = Fs/20;
x_1_20F = resample(x, Fs_1_20F, Fs, 0, 0);
outputFilename_1_20F = '/MATLAB Drive/Trabalho4/DontStopMe_amostragem_1_20F.wav';
audiowrite(outputFilename_1_20F, x_1_20F, Fs_1_20F);
info_1_20F = dir(outputFilename_1_20F);
disp('Informacoes sobre o arquivo amostrado em F/20:');
disp(['Tamanho do arquivo amostrado em F/20: ' num2str(info_1_20F.bytes/1e6) ' MB']);
disp(['Taxa de amostragem amostrada em F/20: ' num2str(Fs_1_20F) ' Hz']);
figure;
subplot(3,1,1);
plot(t_F, x, 'LineWidth', 1);
title('Amostragem em F');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot((0:length(x_2F)-1) / Fs_2F, x_2F, 'LineWidth', 1);
title('Amostragem em 2F');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot((0:length(x_8F)-1) /Fs_8F, x_8F, 'LineWidth', 1);
title('Amostragem em 8F');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
figure;
subplot(3,1,1);
plot(t_F, x, 'LineWidth', 1);
title('Amostragem em F');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot((0:length(x_1_5F)-1) / Fs_1_5F, x_1_5F, 'LineWidth', 1);
title('Amostragem em F/5');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot((0:length(x_1_20F)-1)/Fs_1_20F, x_1_20F, 'LineWidth',1);
title('Amostragem em F/20');
xlim(limite_tempo);
xlabel('Tempo (s)');
ylabel('Amplitude');
