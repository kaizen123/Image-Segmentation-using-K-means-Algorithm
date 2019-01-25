                    %% IMAGE SEGMENTATION THROUGH K MEANS CLUSTERING
                    
a = rgb2gray(imread('Tumor.png'));
figure,imshow(a);
%% Applying k means here 
imData = reshape(a,[],1); % convert it to an array
imData = double(imData); % convert from uint8(8 bit unsigned integer array) to double array
[ IDX, nn] = kmeans(imData,4); % performs k-means with N cluster and returns the index of the nearest neighbour
imIDX = reshape(IDX, size(a)); % reshapes the images according to the size of the array 
%% Final Grayscale
figure,
   imshow(imIDX,[]),title('index image'); % displays the grayscale image, scaling the display based on the range of pixel values
%% Discretised
  figure,
 subplot(3,2,1), imshow(imIDX==1, []);
 subplot(3,2,2), imshow(imIDX==2, []);
 subplot(3,2,3), imshow(imIDX==3, []);
 subplot(3,2,4), imshow(imIDX==4, []);
%% Area opening( To remove the unwanted area)
bw = (imIDX==4); % converts the grayscale image into binary image 
se = ones(5); % create array of all ones and returns an n by n matrix of ones
bw = imopen(bw,se);
bw = bwareaopen(bw,400); % Removes unwanted objects using bwareaopen function.
figure,imshow(bw);
