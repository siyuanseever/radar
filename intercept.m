function [ determine ] = intercept(input_signal, Pfa_t, beta_2)
%input_signal:���Ż����յ��ź�
%determine:�ж��Ƿ����״��ź�
%Pfa_t:�龯��
%beta_2:��������

N = length(input_signal);

T = 0:0.01:400;                                                      %����
%����ȫ٤����Ƥ��ѷ��ʽ�Ĳ���
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
