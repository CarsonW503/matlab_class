%tragectory function
function out = tragectory(t,y,C)

%gamma = C(1);

trajectory = [y(3); y(4); -C(1)*V*y(3); -C(1)*V*y(4)-g];
end