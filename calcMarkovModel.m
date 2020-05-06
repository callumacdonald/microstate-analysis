function matrix = calcMarkovModel(labels)
    matrix = zeros(4,4);

    for i = 1:length(labels)-1
        matrix(labels(i),labels(i+1))=matrix(labels(i),labels(i+1))+1;
    end
      
    matrix(1,:) = matrix(1,:)/sum(matrix(1,:));
    matrix(2,:) = matrix(2,:)/sum(matrix(2,:));
    matrix(3,:) = matrix(3,:)/sum(matrix(3,:));
    matrix(4,:) = matrix(4,:)/sum(matrix(4,:));
end