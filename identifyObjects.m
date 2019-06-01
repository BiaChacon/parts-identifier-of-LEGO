function identifyObjects(desc,qtImages,numParts)
  
  totalRectangle = 0;
  totalSquare = 0;
  totalRound = 0;
  
  rectangle = 0;
  square = 0;
  round = 0;
  
  cont2 = 1;
  
  for i=1:qtImages
    
    disp(strcat("\nImagem \t",num2str(i)))
    
    for j=1:numParts(1,i)
        if desc(cont2,1) < 1 
          round = round + 1;
        elseif desc(cont2,1) >= 1
            rectangle = rectangle + 1;
        elseif desc(cont2,1) >= 1
            square = square + 1;
        end
       cont2 = cont2 + 1;
    end
    
    disp(strcat("Retangulos\t",num2str(rectangle)));
    disp(strcat("Quadrados\t",num2str(square)));
    disp(strcat("Redondas\t",num2str(round)));
    
    totalRectangle = totalRectangle + rectangle;
    totalSquare = totalSquare + square;
    totalRound = totalRound + round;
    
    rectangle = 0;
    square = 0;
    round = 0;
    
  endfor
  
  disp("\nResultado Final")
  disp(strcat("Total de parts ratangulares\t",num2str(totalRectangle)));
  disp(strcat("Total de parts quadradas\t",num2str(totalSquare)));
  disp(strcat("Total de parts redondas\t",num2str(totalRound)));

endfunction