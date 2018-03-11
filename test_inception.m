beta_2 = 2;
Pfa_t = 0.1;

count = 0;
for i=1:100
    input_signal = sqrt(beta_2)*1/sqrt(2)*(randn(1,100) + 1i*randn(1,100));
    count =count + intercept(input_signal, Pfa_t, beta_2);
end
count/100