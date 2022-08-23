%% Cargue y visualización de señales
x11 = variable1(1,:);
x12 = variable1(2,:);

Fs = variable2.SamplingRateHz;
Ts = 1/Fs;


size = (length(x11)-1)*Ts
vtime = 0:Ts:size;


figure(1)
x1 = subplot(211);
plot(vtime,x11);
title('Señal','FontSize',12);

x2 = subplot(212);
plot(vtime,x12);
title('Señal','FontSize',12);

linkaxes([x1 x2],'xy')
x1.XLim = [0.5 1.5];


%% Cálculo de umbral estadístico y función findpeaks

mu = mean(x12);
st_deviation = std(x12);

th = mu*2*st_deviation;
th2 = mu*4*st_deviation;

[pks1,locs1] = findpeaks(-x12, vtime, 'MinPeakHeight',-th);

figure(2)
plot(vtime,x12)
hold on
plot(locs1, -pks1, '^r') 
hold off
grid


%% Creando vector binario

v_ceros = zeros(1,length(x12));
idx=find(-x12>-th);

v_ceros(idx) = 40;


figure(3)
x1 = subplot(211);
plot(vtime,-v_ceros, 'r');
title('Señal','FontSize',12);

x2 = subplot(212);
plot(vtime,x12);
hold on
plot(vtime,-v_ceros);
title('Señal','FontSize',12);

linkaxes([x1 x2],'xy')
x1.XLim = [0.5 1.5];


%% Filtrado de la señal

%Coeficientes del DeisgnerFilter

dFilt = designfilt('bandpassfir', ...
    'FilterOrder', 86, ...
    'StopbandFrequency1', 20, ...
    'PassbandFrequency1', 25, ...
    'PassbandFrequency2', 30, ...
    'StopbandFrequency2', 40, ...
    'DesignMethod', 'equiripple', ...
    'SampleRate', Fs);

z=filtfilt(dFilt,x12);

mu_2 = mean(z);
st_deviation_2 = std(z);

th_z = mu_2*6*st_deviation_2;

v_ceros2 = zeros(1,length(z));
idx2=find(-z>-th_z);

v_ceros2(idx2) = 10;

figure(4)
x1 = subplot(211);
plot(vtime,x12);
title('Señal','FontSize',12);

x2 = subplot(212);
plot(vtime,z);
hold on
plot(vtime,-v_ceros2, 'r');
title('Señal','FontSize',12);

linkaxes([x1 x2],'xy')
x1.XLim = [0.5 1.5];


