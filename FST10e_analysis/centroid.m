centr = zeros(n_cluster,1);

for i = 1:length(id)
    centr(id(i)) = centr(id(i))+1;
end

figure;
x = zeros(n_cluster,1);
plot(centr,'X');

result = C;
result(:,3) = centr.*C(:,3);
figure;
scatter3(result(:,1),result(:,2),result(:,3),50,'o', 'filled','k');
figure;
plot(result(:,3),'X','MarkerSize',10);