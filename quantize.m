function quantize(fileName, level)
img = imread(fileName);
 imshow(img);
 pause(3);
 
fac = 256/level;

[h w]=size(img);

for i=1:h
    for j=1:w
        times = floor(img(i,j)/fac);
        perSize = round(256/(level-1));
        img(i,j) = times * perSize;
    end
end
figure,imshow(uint8(img))
imwrite(uint8(img),'quantized.png');
 