Clc
clear all
clear all
disp('======================================')
disp(' TUGAS AKHIR ')
disp(' ESTIMASI TINGKAT INFLASI NASIONAL ')
disp('MENGGUNAKAN ARCH-GARCH FILTER KALMAN ')
disp(' oleh : ')
disp(' Radisha Fanni Sianti(06111740000045) ')
disp('======================================')
Q=input('Masukan nilai Q : ');%System noise strength
R=input('Masukan nilai R : ');%Nilai matrik error kovarian measurement
disp('======================================')
tic;

%DATA
n=12;%Banyaknya data yang diestimasi KF
a00=2.658115997;%Hasil Peramalan Jan 2020 
a10=2.61775102;%Hasil Peramalan Feb 2020 
a=xlsread('inflasi1.xlsx','aktual'); %Data Tingkat Inflasi Nasional
b=xlsread('inflasi1.xlsx','forecast'); %Data Peramalan Tingkat Inflasi Nasional
c=xlsread('inflasi1.xlsx','bias'); %Data Bias Tingkat Inflasi Nasional

%TAHAP INISIALISASI
%Nilai matriks dalam sistem
A=eye(2);
%Nilai matriks error kovarian noise
Qk=eye(2)*Q;
%Nilai matriks error kovarian measurement
Rk=R;
%Nilai matriks x0 awal
xtopi(:,1)=[a00 a10];
%Nilai matriks error kovarian sistem awal
p(:,1)=[1,0];
p(:,2)=[0,1];
%Nilai matriks H
H=[ones(12,1),a];

%TAHAP PREDIKSI DAN TAHAP KOREKSI
for i = 1:n
 %TAHAP PREDIKSI
 xf(:,i)=A*xtopi(:,i);
 ptopi=[p(1,2*i-1) p(1,2*i); 
 p(2,2*i-1) p(2,2*i)];
 pf=A*ptopi*A'+Qk;
 
 %TAHAP KOREKSI
 %Kalman gain
 kg=pf*H(i,:)'*inv((H(i,:)*pf*H(i,:)'+Rk));
 ptopi=pf-(kg*H(i,:)*pf);
 p(:,2*i+1)=ptopi(:,1);
 p(:,2*i+2)=ptopi(:,2);
 xtopi(:,i+1)=xf(:,i)+kg*(c(i,:)-(H(i,:)*xf(:,i)));
end

%Menampilkan Hasil Estimasi a0,i dan a1,i
Estimasi_a0i =strcat('Nilai a0,i = ', 
num2str(xtopi(1,n)));
Estimasi_a1i= strcat('Nilai a1,i = ', 
num2str(xtopi(2,n)));
Estimasi_a0i 
Estimasi_a1i

%Membuat Plot a0,i dan a1,i
figure(1)
set(plot(xtopi(1,:)),'color','black')
hold on
set(plot(xtopi(2,:)),'color','red')
grid on
title('Estimasi Koefisien Polinomial');
xlabel('Bulan');
ylabel('Nilai Koefisien');
legend('a0','a1');

%Membuat Plot Data Aktual, ARCH, ARCH-FILTER KALMAN
figure(2)
for i=1:n
 bias(i)=xtopi(1,i+1)+xtopi(2,i+1)*a(i);
 kf(i)=bias(i)+b(i);
 ape(i)=(abs(a(i)-kf(i))/a(i))*100;
 sape(1)=0;
 sape(i+1)=ape(i)+sape(i);
end
MAPE=sape(i+1)/n
Nilai_MAPE=strcat('Nilai MAPE= ',num2str(MAPE));
plot(a,'-*k')
hold on
set(plot(b),'color','blue')
hold on
set(plot(kf),'color','red')
hold on
grid on
title('Estimasi Tingkat Inflasi Nasional 
Polinomial 1');
xlabel('Bulan');
ylabel('Tingkat Inflasi Nasional');
legend('Data Aktual','ARCH','ARCH-Filter 
Kalman');

Clc
clear all
clear all
disp('======================================')
disp(' TUGAS AKHIR ')
disp(' ESTIMASI TINGKAT INFLASI NASIONAL ')
disp('MENGGUNAKAN ARCH-GARCH FILTER KALMAN ')
disp(' oleh : ')
disp(' Radisha Fanni Sianti(06111740000045) ')
disp('======================================')
Q=input('Masukan nilai Q : ');%System noise strength
R=input('Masukan nilai R : ');%Nilai matrik error kovarian measurement
disp('======================================')
tic;

%DATA
n=12; %Banyaknya data yang diestimasi Filter Kalman
a00=2.658115997; %Data Hasil Peramalan bulan Januari 2020 
a10=2.61775102; %Data Hasil Peramalan bulan Februari 2020 
a20=2.579878281; %Data Hasil Peramalan bulan Maret 2020 
a=xlsread('inflasi1.xlsx','aktual'); %Data tingkat inflasi nasional
b=xlsread('inflasi1.xlsx','forecast'); %Data Peramalan tingkat inflasi nasional
c=xlsread('inflasi1.xlsx','bias'); %Data bias 
d=xlsread('inflasi1.xlsx','pangkat2'); %Data tingkat inflasi nasional^2

%TAHAP INISIALISASI
%Nilai matrik dalam sistem
A=eye(3);
%Nilai matrik error kovarian noise
Qk=eye(3)*Q;
%Nilai matrik error kovarian measurement
Rk=R;
%Nilai matrikS xo awal
xtopi(:,1)=[a00 a10 a20];
%Nilai matrik error kovarian sistem awal
p(:,1)=[1,0,0];
p(:,2)=[0,1,0];
p(:,3)=[0,0,1];
%Matriks H
H=[ones(12,1),a,d];

%TAHAP PREDIKSI DAN KOREKSI
for i = 1:n
 %TAHAP PREDIKSI
 xf(:,i)=A*xtopi(:,i);
 ptopi=[p(1,3*i-2) p(1,3*i-1) p(1,3*i); 
 p(2,3*i-2) p(2,3*i-1) p(2,3*i); 
 p(3,3*i-2) p(3,3*i-1) p(3,3*i)];
 pf=A*ptopi*A'+Qk;
 
 %TAHAP KOREKSI
 %Kalman gain
 kg=pf*H(i,:)'*inv((H(i,:)*pf*H(i,:)'+Rk));
 ptopi=pf-(kg*H(i,:)*pf);
 p(:,3*i+1)=ptopi(:,1);
 p(:,3*i+2)=ptopi(:,2);
 p(:,3*i+3)=ptopi(:,3);
 xtopi(:,i+1)=xf(:,i)+kg*(c(i,:)-
(H(i,:)*xf(:,i))); 
end

%Menampilkan Hasil Estimasi a0,i a1,i dan a2,i
Estimasi_a0i=strcat('nilai a0,i = ',num2str(xtopi(1,n)));
Estimasi_a1i=strcat('nilai a0,i = ',num2str(xtopi(2,n)));
Estimasi_a2i=strcat('nilai a0,i = ',num2str(xtopi(3,n)));
Estimasi_a0i
Estimasi_a1i
Estimasi_a2i

%Membuat plot nilai a0,a1, dan a2
figure(1)
set(plot(xtopi(1,:)),'color','black')
hold on
set(plot(xtopi(2,:)),'color','red')
hold on
set(plot(xtopi(3,:)),'color','blue')
grid on
title('Estimasi Koefisien Polinomial');
xlabel('Bulan');
ylabel('Nilai Koefisien');
legend('a0','a1','a2');
%plot data, ARCH dan ARCH Filter Kalman
figure(2)
for i=1:n
 bias(i)=xtopi(1,i+1)+xtopi(2,i+1)*a(i)+xtopi(3,i+1)*d(i);
 kf(i)=bias(i)+ b(i);
 ape(i)=(abs(a(i)-kf(i))/a(i))*100;
 sape(1)=0;
 sape(i+1)=ape(i)+sape(i);
end
MAPE=sape(i+1)/n
Nilai_MAPE=strcat('Nilai MAPE= ',num2str(MAPE));
plot(a,'-*k')
hold on
set(plot(b),'color','blue')
hold on
set(plot(kf),'color','red')
hold on
grid on
title('Estimasi Tingkat Inflasi Nasional polinomial 2');
xlabel('Bulan');
ylabel('Tingkat Inflasi Nasional');
legend('Data Aktual','ARCH','ARCH-Filter Kalman')
