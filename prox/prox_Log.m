function y = prox_Log(x, lambda, theta)

size_x = size(x);
x = x(:);

y = proximalRegC(x, length(x), lambda, theta, 2);
% u = abs(x);
% z = u - theta;
% v = z.^2 - 4 * (lambda - u * theta);
% if v >= 0
%     sqrt_v = sqrt(v);
%     x1 = 0 * u;
%     x2 = max(0, 0.5*(z + sqrt_v));
%     x3 = max(0, 0.5*(z - sqrt_v));
%     y1 = 0.5 * u.^2;
%     y2 = 0.5 * (x1 - u).^2 + lambda * log(1+x1/theta);
%     y3 = 0.5 * (x2 - u).^2 + lambda * log(1+x2/theta);
%     y = x1;
%     if y2 >= y1 & y2 >= y3
%         y = x2;
%     elseif y3 >= y1 & y3 > y2
%         y = x3;
%     end
%     %         X = [x1';x2';x3']; Y = [y1';y2';y3']; Z = zeros(3,length(u));
%     %         [I,J] = find(Y==max(Y));
%     %         Z(sub2ind(size(Z),I,J)) = X(sub2ind(size(Z),I,J));
%     %         y = sum(Z)';
%     y = sign(x) .* y;
% else
%     y = 0 * u;
% end

y = reshape(y, size_x);
end
