
% Abre as imagens
noPlayerImage = rgb2gray(imread('campo0.JPG'));
player = rgb2gray(imread('campo1.JPG'));

[i,j] = size(noPlayerImage);

passoLinha = 1;
passoColuna = 1;
for linha=1:passoLinha:i
    for coluna=1:passoColuna:j
        image1 = noPlayerImage(linha:linha+(passoLinha-1),coluna:coluna+(passoColuna-1));
        image2 = player(linha:linha+(passoLinha-1),coluna:coluna+(passoColuna-1));
        valor = compare(image1,image2);
    end
end

function [itsDifferent] = compare(image1,image2)
    
    threshold = 10;
       
    hist1 = imhist(image1);
    hist2 = imhist(image2);
    
    itsDifferent = 0;
    for i=1:size(hist1)
        if hist1(i) - hist2(i) > threshold
            itsDifferent = 1;
        end
    end
end
