% Dice overlap

function overlap = dice(seg1, seg2)

seg1_ = seg1 > min(min(seg1));
seg2_ = seg2 > min(min(seg2));

num = 2 * nnz(seg1_ & seg2_);
den = nnz(seg1_) + nnz(seg2_);
overlap = num / den;

end