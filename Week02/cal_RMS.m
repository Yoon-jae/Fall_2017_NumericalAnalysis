function ret = cal_RMS(A)
    ret = sqrt(mean(A(:).^2));
end