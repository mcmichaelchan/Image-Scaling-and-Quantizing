function scale(fileName, height, width)
 img = imread(fileName);
 imshow(img);
 pause(3);
        
img=imread('19.png');
imshow(img);
[h w]=size(img);
m=height/h;              
n=width/w;       
imgn=zeros(height,width);
rot=[m 0 0;0 n 0;0 0 1];                                   

for i=1:height
    for j=1:width
        pix=[i j 1]/rot;   
        
        float_Y=pix(1)-floor(pix(1)); 
        float_X=pix(2)-floor(pix(2));
       
        if pix(1) < 1
            pix(1) = 1;
        end
        
        if pix(1) > h
            pix(1) = h;
        end
        
        if pix(2) < 1
            pix(2) =1;
        end
        
        if pix(2) > w
            pix(2) =w;
        end
        
        pix_up_left=[floor(pix(1)) floor(pix(2))];
        pix_up_right=[floor(pix(1)) ceil(pix(2))];
        pix_down_left=[ceil(pix(1)) floor(pix(2))];
        pix_down_right=[ceil(pix(1)) ceil(pix(2))];     
    
        value_up_left=(1-float_X)*(1-float_Y);
        value_up_right=float_X*(1-float_Y);
        value_down_left=(1-float_X)*float_Y;
        value_down_right=float_X*float_Y;

        imgn(i,j)=value_up_left*img(pix_up_left(1),pix_up_left(2))+ ...
                  value_up_right*img(pix_up_right(1),pix_up_right(2))+ ...
                  value_down_left*img(pix_down_left(1),pix_down_left(2))+ ...
                  value_down_right*img(pix_down_right(1),pix_down_right(2));        
    end
end

figure,imshow(uint8(imgn))
imwrite(uint8(imgn),'zoomed.png');