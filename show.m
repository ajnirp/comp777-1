function show(I)

if islogical(I)
    imshow(I, [0 1])
else
    imshow(I, [min(min(I)) max(max(I))])
end

end