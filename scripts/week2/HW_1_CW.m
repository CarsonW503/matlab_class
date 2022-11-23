%% Problem #1
x = linspace(6,39,100)'
%% Problem #2
% Linspace
y = linspace(-3,12,61)'
%% Problem #3
% Linspace
x = linspace(0,5,6)
A = [x; 2*x; 3*x+10]
%% Problem #4
A = [3, 5, 9; 6, 37, 1; 2, 8, 6]
c = A(3,:)
d = A(:,2)
e = [A(1,:); A(2,:)]
% Top right corner
f = [A(1,2), A(1,3);
    A(2,2), A(2,3)]
%% Problem #5
A_sort_row = sort(A, 2)
A_sort_column = sort(A, 1)
% Another way
% A_sort = sort(A)
%% Problem #6
% Element addition...
% clc
C = [6, 7;
    2, 9]
D = [-9, 3;
    7, 5]
C+D
C-D
C.*D
C./D

% Concate...
horizontal_concat = [C D]
vertical_concat = [C; D]
%% Problem #7
% create 2x2
% clear
% clc
A = {'Matlab', 'Simulink'; [3, 9; 8, 2], [2; 8; 5]}
%
l = A{1}(4)
c_array = A{3}(:)
access_8 = A{2}(2)
access_8_ = A{4}(2)
% Not really sure what is being asked
[a, b, c , d] = deal(A{:})
%% Problem 8
clear
clc
%
ce640student(1).firstname = 'Peter';
ce640student(2).firstname = 'Julia';
ce640student(3).firstname = 'Joe';
ce640student(1).lastname = 'Pan';
ce640student(2).lastname = 'Roberts';
ce640student(3).lastname = 'Biden';
ce640student(1).examscore = [78 79];
ce640student(2).examscore = [82 88];
ce640student(3).examscore = [99 97];
oc512student(1).firstname='Greg';
oc512student(2).firstname='Mary';
oc512student(1).lastname='Jones';
oc512student(2).lastname='Smith';
oc512student(1).examscore=[96 95];
oc512student(2).examscore=[87 75];
%
combined_students = [oc512student, ce640student]
% combined_students(5)
