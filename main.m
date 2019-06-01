close all
clear all
pkg load image

totalParts = 0;

qtImages = 2;
cont1 = 1;
image = 1;

for i=1:qtImages
  
  nameImage = strcat('im',num2str(i),'.jpg');
  partsColor = imread(strcat('C:\Users\Bia Chacon\Desktop\ProjetoPDI\Database\',nameImage));

  bw = im2bw(partsColor);
  figure('Name','Parts binarizada');
  imshow(bw);
  
  for i=1:size(bw,1)
    for j=1:size(bw,2)
      if(bw(i,j) == 1)
        b(i,j) = 0;
       else
        b(i,j) = 1;
       endif
     endfor
  endfor
  
  d = dilatar(b);
  
  [imRotulos,qtParts] = bwlabel(d);
  
  figure('Name','Parts binarizada e erodida'); 
  imshow(d);
   
  rotulos = unique(imRotulos);
  so = separateObjects(imRotulos,rotulos,qtParts);
  
  for a=1:qtParts
    figure('Name','imagem dividida'); 
    imshow(so(:,:,a));
  
  endfor

  disp(strcat("Quantity of parts\t",num2str(qtParts)));
  
  part = segmentacao(partsColor,b,b);
  figure('name','imagem parts segmentadas');
  imshow(part);
  
  figure('NAME','Imagem Rotulada'); 
  imshow(imRotulos,[]);
  
  colormap(jet), colorbar;
  
  eixoMaior = zeros(1,qtParts);
  eixoMenor = zeros(1,qtParts);
  ecce = zeros(1,qtParts);
  areaRP = zeros(1,qtParts); 
  
  totalParts = totalParts + qtParts;
  numParts(1,i) = qtParts;
      
  for j=1:qtParts
     areaRP(1,j) = regionprops(so(:,:,j),"Area").Area;
     eixoMaior(1,j) = regionprops(so(:,:,j),"MajorAxisLength").MajorAxisLength;
     eixoMenor(1,j) = regionprops(so(:,:,j),"MinorAxisLength").MinorAxisLength;
     ecce(1,j) = regionprops(so(:,:,j),"Eccentricity").Eccentricity;
  endfor

  for z=1:qtParts
    desc(cont1,1) = double(ecce(1,z));
    desc(cont1,2) = eixoMaior(1,z);
    desc(cont1,3) = eixoMenor(1,z);
    desc(cont1,4) = areaRP(1,z);
    cont1 = cont1 +1;  
  endfor
  
    disp("\tMeus descritores ")
    disp(desc(1,:))
    disp(desc(2,:))
    disp(desc(3,:))


  if(i<qtImages)
    close all
  endif 
  
endfor



#mostrando os descritores extraidos dos objetos
cont2 = 1;
disp("\tMeus descritores ")
for i=1:qtImages
  disp(strcat("\nImagem \t",num2str(i)))
  for j=1:numParts(1,i)
    disp(numParts,i);
   disp(desc(cont2,:));
   cont2 = cont2 + 1;
  endfor
endfor

disp("IDENTIFYING OBJECTS")
disp(strcat("Total quantity of parts\t",num2str(totalParts)))
identifyObjects(desc,qtImages,numParts);


