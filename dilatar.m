function C = dilatar(im)
  C = im;
  EE = [0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
  C = logical(C);
  dilatada = C;
    
  for i=3:size(C,1)-2
    for j=3:size(C,2)-2
      if(C(i,j)==0) 
        vizA = [1 C(i-2,j-1) C(i-2,j) C(i-2,j+1) 1;...
         C(i-1,j-2) C(i-1,j-1) C(i-1,j) C(i-1,j+1) C(i-1,j+2);...
         C(i,j-2) C(i,j-1) C(i,j) C(i,j+1) C(i,j+2);...
         C(i+1,j-2) C(i+1,j-1) C(i+1,j) C(i+1,j+1) C(i+1,j+2);...
             1 C(i+2,j-1) C(i+2,j) C(i+2,j+1) 1];
       
        if (sum(sum(vizA==EE))!=21) 
          dilatada(i,j)=1;
        endif    
      endif
    endfor
  endfor
  
endfunction