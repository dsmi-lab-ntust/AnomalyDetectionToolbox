function [suspicious_index abof] = ABOD(A)

n=length(A(:,1));
var_array=zeros(n,1);
for i=1:n
    var_front=0;
    var_back=0;
    denominator=0;    
    for j=1:n
        if j==i
            continue
        end
        for k=j+1:n
           if k==i 
                continue
           end
           vector1=A(j,:)-A(i,:);
           vector2=A(k,:)-A(i,:);
           var_front=var_front + (1/(norm(vector1)*norm(vector2))) * (vector1*vector2'/((norm(vector1)*norm(vector2))^2))^2;
%           var_front=var_front + (vector1*vector2'/((norm(vector1)*norm(vector2))^3))^2;
           var_back=var_back + (vector1*vector2'/(norm(vector1)*norm(vector2))^3);
           denominator=denominator + (1/(norm(vector1)*norm(vector2)));
        end
    end
    var_array(i)=var_front/denominator-(var_back/denominator)^2;
end

% normalize the abof
abof = (var_array-min(var_array))/(max(var_array)-min(var_array));
[non,suspicious_index]=sort(abof,'ascend');



