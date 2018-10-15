
% Created by Oguz Celikel Oct-15-2018

freq_1 = 200 ;
freq_2 = 600 ;
duration = 0.05 ;

%when the sample frequency lower than Nyquist frequency

Fs_high = 600 ;
t1 = 0 : (1/Fs_high ) : duration ;
signal_1 = sin( 2 * pi * freq_1 .* t1 ) + 4 * cos( 2 * pi * freq_2 .* t1 ) ;

%applying for Fourier Transform with N equals to number of samples in time domain

N1 = length( t1 ) ;
transformed_signal_1 = fft( signal_1 , N1 ) ;
transformed_shifted_1 = fftshift( transformed_signal_1 ) ;

%applying for Inverse Fourier Transform 

inv_transformed_1 = ifft( transformed_signal_1 , N1 ) ;

%plotting original signal, magnitude response of the frequency domain signal, and Inverse Fourier Transformed signal

figure ;
subplot( 311 ) ;
plot( t1 , signal_1 ) ;
title( ' Sample frequency < Nyquist frequency ' ) ;
xlabel( ' Time Domain ' ) ;
ylabel( ' Original Signal ' ) ;
subplot( 312 ) ;
plot( t1 , abs( transformed_shifted_1 ) ) ;
xlabel( ' Frequency Domain ' ) ;
ylabel( ' Magnitude Response ' ) ;
subplot( 313 ) ;
plot( t1 , inv_transformed_1 ) ;
xlabel( ' Time ' ) ;
ylabel( ' Inverse Fourier Transformed Signal ' ) ;

%when the sample frequency higher than Nyquist frequency

Fs_high = 10000 ;
t2 = 0 : (1/Fs_high ) : duration ;
signal_2 = sin( 2 * pi * freq_1 .* t2 ) + 4 * cos( 2 * pi * freq_2 .* t2 ) ;


%applying for Fourier Transform with N equals to number of samples in time domain

N2 = length( t2 ) ;
transformed_signal_2 = fft( signal_2 , N2 ) ;
transformed_shifted_2 = fftshift( transformed_signal_2 ) ;


%applying for Inverse Fourier Transform 

inv_transformed_2 = ifft( transformed_signal_2 , N2 ) ;

%plotting original signal, magnitude response of the frequency domain signal, and Inverse Fourier Transformed signal

figure ;
subplot( 311 ) ;
plot( t2 , signal_2 ) ;
title( ' Sample frequency > Nyquist frequency ' ) ;
xlabel( ' Time Domain ' ) ;
ylabel( ' Original Signal ' ) ;
subplot( 312 ) ;
plot( t2 , abs( transformed_shifted_2 ) ) ;
xlabel( ' Frequency Domain ' ) ;
ylabel( ' Magnitude Response ' ) ;
subplot( 313 ) ;
plot( t2 , inv_transformed_2 ) ;
xlabel( ' Time ' ) ;
ylabel( ' Inverse Fourier Transformed Signal ' ) ;