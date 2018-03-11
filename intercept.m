function [ determine ] = intercept(input_signal, Pfa_t, beta_2)
%input_signal:干扰机接收的信号
%determine:判断是否有雷达信号
%Pfa_t:虚警率
%beta_2:噪声功率

N = length(input_signal);

T = 0:0.01:400;                                                      %门限
%不完全伽马函数皮尔逊形式的参数
u = T/sqrt(N);
M = N-1;
Pfa = 1 - gammainc(u*sqrt(M+1),M+1);


col = find( abs(Pfa-Pfa_t) == min(abs(Pfa-Pfa_t)) );
T1 = T(col);

if norm(input_signal)^2/beta_2 > T1
    determine = 1;
else
    determine = 0;
end
