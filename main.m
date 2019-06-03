close all
clear all
pkg load image

totalParts = 0;

qtImages = 1;
cont1 = 1;
image = 1;

for k=1:qtImages
  
  nameImage = strcat('im',num2str(k),'.jpg');
  im = imread(strcat('C:\Users\Bia Chacon\Desktop\ProjetoPDI\Database\',nameImage));

  partsColor = imresize(im,0.2);
  figure('Name','Imagem de Entrada');
  imshow(partsColor);

  bw = im2bw(partsColor);
  figure('Name','Parts binarizada');
  imshow(bw);
  
  for g=1:size(bw,1)
    for h=1:size(bw,2)
      if(bw(g,h) == 1)
        b(g,h) = 0;
       else
        b(g,h) = 1;
       endif
     endfor
  endfor
  
  er = erosion(b);
  
  [imRotulos,qtParts] = bwlabel(er);
  
  figure('Name','Parts binarizada e erodida'); 
  imshow(er);
   
  rotulos = unique(imRotulos);
  so = separateObjects(imRotulos,rotulos,qtParts);
  qtParts = qtParts-1;
  
  for a=1:qtParts
    figure('Name','imagem dividida'); 
    imshow(so(:,:,a));
  
  endfor

  part = segmentation(partsColor,b,b);
  figure('name','imagem parts segmentadas');
  imshow(part);
  
  figure('NAME','Imagem Rotulada'); 
  imshow(imRotulos,[]);
  
  colormap(jet), colorbar;
  
  eixoMaior = zeros(1,qtParts);
  eixoMenor = zeros(1,qtParts);
  ecce = zeros(1,qtParts);
  
  numParts(1,k) = qtParts;
      
  for j=1:qtParts+1
     eixoMaior(1,j) = regionprops(so(:,:,j),"MajorAxisLength").MajorAxisLength;
     eixoMenor(1,j) = regionprops(so(:,:,j),"MinorAxisLength").MinorAxisLength;
     ecce(1,j) = regionprops(so(:,:,j),"Eccentricity").Eccentricity;
  endfor

  for z=1:qtParts+1
    desc(cont1,1) = double(ecce(1,z));
    desc(cont1,2) = eixoMaior(1,z);
    desc(cont1,3) = eixoMenor(1,z);
    cont1 = cont1 + 1;  
  endfor

endfor

disp("\n########################## MEUS DESCRITORES ##################################") 
cont2 = 1;
for x=1:qtImages
  disp(strcat("\nImagem ",num2str(x),":"))
  for y=1:numParts(1,x)+1
   disp(desc(cont2,:));
   cont2 = cont2 + 1;
  endfor
endfor

disp("\n######################### IDENTIFICANDO OBJETOS #################################")
identifyObjects(desc,qtImages,numParts);
