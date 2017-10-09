es = 0.5;
ea = 1;
true_val = cos(pi/4);
x = pi/4;
order = 1;
old_val = 1;
disp('cos(pi/4) : ' + true_val + ' (True value)');

while ea > es
    val = 0;
    for k = 0:1:order
        val = val + power(x, 2 * k) / factorial(2 * k) * power(-1, k);
    end
    disp('order : ' +  order + ', val : ' + val);
    ea = abs((val - old_val) / val) * 100;
    disp('ea : ' + ea + ', es : ' + es);
    old_val = val;
    order = order + 1;
end
