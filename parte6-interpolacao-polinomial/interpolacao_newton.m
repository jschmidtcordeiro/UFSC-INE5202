clear
clc
x = [0.1 0.3 0.5 0.7];
y = [0.011 0.117 0.375 0.833];
n = length(x);
xx = 0.6;
D(:, 1) = y;

for j = 2:n

    for i = j:n
        D(i, j) = (D(i, j - 1) - D(i - 1, j - 1)) / (x(i) - x(i - j + 1));
    end

end

D

x0 = D(1, 1);

px = D(1, 1);

for i = 2:n
    p = D(i, i);

    for j = 1:i - 1
        p = p * (xx - x(j));
    end

    px = px + p;
end

px
