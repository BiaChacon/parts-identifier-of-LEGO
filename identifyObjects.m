function identifyObjects(desc,qtImages,numParts)

  rectangle = 0;
  square = 0;
  round = 0;
  
  cont2 = 1;
  
  for i=1:qtImages
    
    disp(strcat("\nImagem ",num2str(i),":"))
    
    for j=1:numParts(1,i)+1
        if desc(cont2,1) ==  0.00000 
          round = round + 1;
        elseif desc(cont2,1) <= 1 && ((desc(cont2,2)/2) >= desc(cont2,3))
            rectangle = rectangle + 1;
        elseif desc(cont2,1) <= 1 && ((desc(cont2,2)/2) <= desc(cont2,3))
            square = square + 1;
        end
       cont2 = cont2 + 1;
    end
    
    disp(strcat("\nQuantidade de pecas: ",num2str(numParts(1,i)+1)));
    disp(strcat("\nRetangulos: ",num2str(rectangle)));
    disp(strcat("\nQuadrados: ",num2str(square)));
    disp(strcat("\nCirculos: ",num2str(round)));
    disp("\n#################################################################################")
    
    rectangle = 0;
    square = 0;
    round = 0;
    
  endfor

endfunction