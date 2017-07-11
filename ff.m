image_folder = 'lama';
images =dir(fullfile(image_folder,'*.bmp')); 
img_array = [];
tot_images = numel(images);

for i = 1:numel(images)
    glcm = stattekstur(imread(['lama/' images(i).name]));
    img_array(1,i) = glcm.mu;
    img_array(2,i) = glcm.deviasi;
    img_array(3,i) = glcm.skewness;
    img_array(4,i) = glcm.energi;
    img_array(5,i) = glcm.entropi;
    img_array(6,i) = glcm.smoothness;
end
 

disp(img_array);
disp(test);
target = ones(1,tot_images);
target(1:tot_images/2) = 0;
 net = feedforwardnet(4, 'trainlm');
 net.trainParam.goal = 0.01;
 net.divideFcn = 'dividetrain';
 net = train(net, img_array, target);
 a = net(img_array);