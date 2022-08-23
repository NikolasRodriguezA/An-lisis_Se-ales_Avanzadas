Frecuencias = param.samplingrate.co2;

Fs_pleth = Frecuencias
Ts = 1/Fs_pleth

co2 = signal.co2.y;
pleth = signal.pleth.y;
ecg = signal.ecg.y;


size = (length(co2)-1)*Ts
vtime = 0:Ts:size;

figure(1)
x1 = subplot(311);
plot(vtime,co2);
title('Respiratory Signal - C02','FontSize',12);

x2 = subplot(312);
plot(vtime,pleth);
title('Cardiac Signal - ECG','FontSize',12);

x3 = subplot(313);
plot(vtime,ecg);
title('Plethysmography - SO2 & Pulse','FontSize',12);

xlabel('time (sec)')



figure(2)
x1 = subplot(311);
plot(vtime,co2);
title('Respiratory Signal - C02','FontSize',12);

x2 = subplot(312);
plot(vtime,pleth);
title('Cardiac Signal - ECG','FontSize',12);

x3 = subplot(313);
plot(vtime,ecg);
title('Plethysmography - SO2 & Pulse','FontSize',12);

xlabel('time (sec)')

linkaxes([x1 x2 x3],'xy')
x1.XLim = [100 180];
