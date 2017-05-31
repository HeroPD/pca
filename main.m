X = zeros(10,2500);
for i=0:9
	image = imread(strcat(int2str(i),'.png'));
	image = double(image);
	X(i+1,:) = reshape(image(:,:,1),1,[]);
end

size(X)

% Run PCA
[U, S] = pca(X);
displayData(U(:, 1:36)');
K = 8;
Z = projectData(X, U, K);
size(Z)

X_rec  = recoverData(Z, U, K);

subplot(1, 2, 1);
displayData(X(1:10,:));
title('Original numbers');
axis square;
subplot(1, 2, 2);
displayData(X_rec(1:10,:));
title('Recovered numbers');
axis square;