function [x1, y1] = searchCenter(x2, y2, I1, I2, Block_Size, Search_Area)
    
    window2 = I2(y2:y2+Block_Size-1,x2:x2+Block_Size-1);
    
    minDist = inf;

    for i = x2-Search_Area:x2+Search_Area-1
        for j = y2-Search_Area:y2+Search_Area-1
            % Get the window to compare from the previous frame
            window1 = I1(j:j+Block_Size-1,i:i+Block_Size-1);
            % Compare the two windows
            minDist_aux = sqrt(sum(sum((double(window1) - double(window2)) .^ 2)));
            
            % Get coordinates if better
            if (minDist_aux < minDist)
                minDist = minDist_aux;
                x1 = i;
                y1 = j;

            end
        end
    end

    
end
