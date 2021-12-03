clear
clc

t=0:.01:(1.25*5);
t=t';
%disp(t)
v1=sin(5*t+deg2rad(45));
v2=sin(5*t+deg2rad(-75));
%disp(v1)
%disp(v2)
i=1;
j=1;
n=1;
for v1t = 1:length(t)
    if n == 1
        if v1(n)==max(v1) | v1(n)==min(v1)
           v1p(i,1) = v1(n);
           v1p(i,2)= n;
           i=i+1;
        end
    elseif n == length(t)
        if v1(n)==max(v1) | v1(n)==min(v1)
           v1p(i,1) = v1(n);
           v1p(i,2)= n;
           i=i+1;
        end
    else
        if v1(n)> v1(n+1)
            if v1(n)> v1(n-1)
                v1p(i,1) = v1(n);
                v1p(i,2)= n;
                i=i+1;
            end
        elseif v1(n)< v1(n+1)
            if v1(n)< v1(n-1)
                v1p(i,1) = v1(n);
                v1p(i,2)= n;
                i=i+1;
            end
        end
    end
    n=n+1;
end
n=1;
for v1t = 1:length(t)
    if n == 1
        if v2(n)==max(v2) | v2(n)==min(v2)
           v2p(j,1) = v2(n);
           v2p(j,2)= n;
           j=j+1;
        end
    elseif n == length(t)
        if v2(n)==max(v2) | v2(n)==min(v2)
           v2p(j,1) = v2(n);
           v2p(j,2)= n;
           j=j+1;
        end
    else
        if v2(n)> v2(n+1)
            if v2(n)> v2(n-1)
                v2p(j,1) = v2(n);
                v2p(j,2)= n;
                j=j+1;
            end
        elseif v2(n)< v2(n+1)
            if v2(n)< v2(n-1)
                v2p(j,1) = v2(n);
                v2p(j,2)= n;
                j=j+1;
            end
        end
    end
    n=n+1;
end

%disp(v1p)
%disp(v2p)
if v1p(1,2) < v2p(1,2)
    adiantado = "v1";
    atrasado = "v2";
    mensagem(adiantado,atrasado)
elseif v1p(1,2) > v2p(1,2)
    adiantado = "v2";
    atrasado = "v1";
    mensagem(adiantado,atrasado)
else
    mensagem1 = "as senoides estão em fase.";
    mensagem2 = "pois os angulos coencidem, logo os picos também.";
    disp(mensagem1)
    disp(mensagem2)
end

plot (t,v1,'*',t,v2,'o'),legend('v1=sin(5*t+deg2rad(45))','v2=sin(5*t+deg2rad(-75))'),xlabel('tempo[s]'), ylabel('tensão[V]'), grid, title('tensão no tempo')

function mensagem(adiantado,atrasado)
mensagem1 = strcat(adiantado," esta adiantado em relação a ",atrasado);
mensagem2 = strcat ("pois o pico de ",adiantado," acontece antes do pico de ",atrasado,".");
disp(mensagem1)
disp(mensagem2)
end