% Dice overlap

function overlap = dice(seg1, seg2)

num = 2 * nnz(seg1 & seg2);
den = nnz(seg1) + nnz(seg2);
overlap = num / den;

end