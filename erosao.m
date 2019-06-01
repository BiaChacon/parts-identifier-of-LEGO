function C = erosao(im)
  B = [1 1 1; 1 1 1; 1 1 1];
  C = im;
  for i=2:size(im,1)-1
    for j=2:size(im,2)-1
      if(im(i,j)==1)
        vizA = [im(i-1,j-1) im(i-1,j) im(i-1,j+1);...
              im(i,j-1) im(i,j) im(i,j+1);...
              im(i+1,j-1) im(i+1,j) im(i+1,j+1)];
        if (sum(sum(vizA==B))!=9)
          C(i,j)=0;
        end    
      end
    end
  end

endfunction