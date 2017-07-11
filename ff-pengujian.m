 test = [];
 images = dir('test/*.jpg');
 for i = 1:numel(images)
     glcm = stattekstur(imread(['test/' images(i).name]));
     test(1,i) = glcm.mu;
     test(2,i) = glcm.deviasi;
     test(3,i) = glcm.skewness;
     test(4,i) = glcm.energi;
     test(5,i) = glcm.entropi;
     test(6,i) = glcm.smoothness;
end