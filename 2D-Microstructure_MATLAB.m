% Q1 and Q2 are done together in this single code 
% % % % % % % % % % % % % % % % % % % % % %
clear
clc
num_grain = input('Enter number of grains: \n'); 
vel_x = input('Enter the growth velocity in x direction: \n');    
vel_y = input('Enter the growth velocity in y direction: \n');
n = input('Enter Grid Size: \n');  %  grid size must be greater than num_grain!!!!!
timef = input('Enter frequency: \n');   
grid = zeros(n,n);    % Zeros in all pos of grid
x_pos= randperm(n,num_grain);
y_pos= randperm(n,num_grain);
%disp(x_pos); % to check if random number creation is successful 
%disp(y_pos);
for i=1:num_grain
    grid(x_pos(i),y_pos(i))=i;
end

 % imagesc(grid);  % to check if grid creation and random seeding is succesful

for i=1:n         % running through each pixel 
    for j=1:n
         for time=1:timef
                 while(grid(i,j)==0) % Running the loop through the grid
                    for k= 1:num_grain
                        val_1=((i-x_pos(k))/(vel_x*time))^2; %  condition checking 
                        val_2=((j-y_pos(k))/(vel_y*time))^2;
                        val(k)=val_1+val_2;
                    end
               
                    for m=1:num_grain                   
                        if(val(m)==min(val))    % checking the closest position condition
                        grid(i,j)=grid(x_pos(m),y_pos(m));
                        end    
                    end    
                 end
         end      
    end
end


imagesc(grid);   %Printing the final microstructure
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%code to calculate the number of pixels for q2  
inner_pixel=0;
GB_pixel=0;
TP_pixel=0;
% checking the matrix excluding the end columns 
for a=2:n-1
    for b=2:n-1
          coord(1)=grid(a,b);   % coordinate of the pixel to be checked for 
          coord(2)=grid(a,b+1);
          coord(3)=grid(a,b-1);
          coord(4)=grid(a+1,b);
          coord(5)=grid(a-1,b);    % coordinate of the surrounding pixel  
          coord(6)=grid(a+1,b-1);
          coord(7)=grid(a+1,b+1);
          coord(8)=grid(a-1,b+1);
          coord(9)=grid(a-1,b-1);
          dummy1=unique(coord);  % checking the no of unique values
          if (numel(dummy1)==1)
                inner_pixel=inner_pixel+1;
          elseif (numel(dummy1)==2)
                GB_pixel=GB_pixel+1;
          elseif (numel(dummy1)==3)
                TP_pixel=TP_pixel+1;      
          end    
        
    end    
end

% checking the side 4 columns

for c=2:n-1
    coord_1(1)=grid(c,1);
    coord_1(2)=grid(c,2);
    coord_1(3)=grid(c+1,1);
    coord_1(4)=grid(c-1,1);
    coord_1(5)=grid(c+1,2);
    coord_1(6)=grid(c-1,2);
     dummy2=unique(coord);  % checking the no of unique values
          if (numel(dummy2)==1)
                inner_pixel=inner_pixel+1;
          elseif (numel(dummy2)==2)
                GB_pixel=GB_pixel+1;
          elseif (numel(dummy2)==3)
                TP_pixel=TP_pixel+1;      
          end    
end    

for c=2:n-1
    coord_1(1)=grid(n,c);
    coord_1(2)=grid(n,c-1);
    coord_1(3)=grid(n,c+1);
    coord_1(4)=grid(n-1,c);
    coord_1(5)=grid(n-1,c+1);
    coord_1(6)=grid(n-1,c-1);
     dummy2=unique(coord);  % checking the no of unique values
          if (numel(dummy2)==1)
                inner_pixel=inner_pixel+1;
          elseif (numel(dummy2)==2)
                GB_pixel=GB_pixel+1;
          elseif (numel(dummy2)==3)
                TP_pixel=TP_pixel+1;      
          end    
end    

for c=2:n-1
    coord_1(1)=grid(1,c);
    coord_1(2)=grid(1,c-1);
    coord_1(3)=grid(1,c+1);
    coord_1(4)=grid(2,c);
    coord_1(5)=grid(2,c-1);
    coord_1(6)=grid(2,c+1);
     dummy2=unique(coord);  % checking the no of unique values
          if (numel(dummy2)==1)
                inner_pixel=inner_pixel+1;
          elseif (numel(dummy2)==2)
                GB_pixel=GB_pixel+1;
          elseif (numel(dummy2)==3)
                TP_pixel=TP_pixel+1;      
          end    
end    

for c=2:n-1
    coord_1(1)=grid(c,n);
    coord_1(2)=grid(c+1,n);
    coord_1(3)=grid(c-1,n);
    coord_1(4)=grid(c,n-1);
    coord_1(5)=grid(c-1,n-1);
    coord_1(6)=grid(c+1,n-1);
     dummy2=unique(coord);  % checking the no of unique values
          if (numel(dummy2)==1)
                inner_pixel=inner_pixel+1;
          elseif (numel(dummy2)==2)
                GB_pixel=GB_pixel+1;
          elseif (numel(dummy2)==3)
                TP_pixel=TP_pixel+1;      
          end    
end    

inner_pixel_frac=inner_pixel/(n*n); % fraction of inner pixel
GB_pixel_frac=GB_pixel/(n*n);       % fraction of GB_pixel  
TP_pixel_frac=TP_pixel/(n*n);       % fraction of Triple point pixel

