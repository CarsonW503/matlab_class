%Week 3 Part 1 - Matlab Class
%Dave Hill

%This will look at functions

clear all
close all
home

%% BLOCK 3.1

%We have seen what a 'script' is, basically a standalone text file that can
%be executed, at which time the commands in the script are run. You might
%have some sort of operation that you wish to repeat over and over in
%different situations. Having to 're-code' that into a script each time is
%poor form. So, in Matlab, it is very common to write 'functions' (which
%are similar to subroutines in fortran). These functions, if placed into
%Matlab's path, can be called from anywhere, allowing you access to the
%computational commands within the functions.

%Let us start with a very simple function. Place the following text (minus
%the first comment symbol on each line) into a text file and save it as
%cent2fahr.m. Save it in the same folder as this script. Once you have done
%this, you can run this section.

%function TF=cent2fahr(TC)
%%This function will convert temperature in centigrade to fahrenheit
%%Created by NAME on DATE
%%-
%%TC - (input) temperature in centigrade
%%TF - (output) temperature in Fahrenheit

%TF=TC*9/5+32;
%%end of function


%test function
tf=cent2fahr(0)

%% BLOCK 3.2

%great, that worked nicely. One thing to note about functions, there is no
%way that the function can modify the value of a variable passed in. For
%example, change your function code to what is below, save it to a file
%called cent2fahr_v2.m. Again, note that you have to remove the first %
%symbol from each line. If you look in the ribbon above, you will see
%(under the comment option) a tool that will do this automatically for a
%block of lines. Once you have done this, run this section.

%function TF=cent2fahr_v2(TC)
%%This function will convert temperature in centigrade to fahrenheit
%%Created by NAME on DATE
%%-
%%TC - (input) temperature in centigrade
%%TF - (output) temperature in Fahrenheit

%TF=TC*9/5+32;
%TC=NaN
%%end of function


%Note that, in this function, for some inexplicable reason, I take 
%the INPUT temperature variable and I set it to NaN. Now:

home
tC=10
TF=cent2fahr_v2(tC)
tC

%Several things. First, we see that we are able to pass variables (TC) into
%functions. Second, although I try to sabotage things by setting TC to NaN
%inside the function, it has NO EFFECT on TC outside of the function. 
%This is a CRUCIAL aspect of programming. Variables passed into functions 
%should not be allowed to be changed by that function! 

%% BLOCk 3.3

%Now, if you were paying attention, our function had two 'parameters' in
%it. 9/5 and 32. While it is fine to have those values 'hard coded' in, given
%that they are true constants in this conversion equation, there are other
%times when we might wish to reuse some function, but with different
%parameters. In this case, maybe we wanted to use our function to do a 
%Kelvin to Rankine conversion or something like that...
%So, good programming practice is to 'pass in' parameters. So,
%change your function code to the text below and save it to cent2fahr_v3.m
%and then run this section.

%function TF=cent2fahr_v3(TC,scale,offset)
%%This function will convert temperature in centigrade to fahrenheit
%%Created by NAME on DATE
%%-
%%TC - (input) temperature in centigrade
%%TF - (output) temperature in Fahrenheit

%TF=TC*scale+offset;
%%end of function


home
tc=100
scale_factor=9/5
offset_factor=32
TF=cent2fahr_v3(tc,scale_factor,offset_factor)

%incidentally. Note that in the matlab workspace, I defined the temp in
%centigrade using the variable tc, and not TC. Remember how matlab is funny
%about caps vs lowercase. Here it DOES NOT MATTER. tc in the workspace is
%complete separate from the variable TC in the function. Don't believe me?

%% Try running this section:

home
anyvariablenameyouwant=100
scale_factor=9/5
offset_factor=32
TF=cent2fahr_v3(anyvariablenameyouwant,scale_factor,offset_factor)

%So, this is a really important thing to recognize. When you call a
%function, you send in various arguments, say A, B, and C. In the function
%definition, the only thing that matters is the 'order' of the arguments,
%not the names. If you function definition is like function_name(X,Y,Z)
%then X plays the role of A, Y the role of B, and Z the role of C.

%% BLOCK 3.4

%A rather more sloppy (and ill-advised) way of doing this is with global
%variables / parameters. In your main script (or at command window) you
%define a variable as global. Then, it can be accessed in all functions.
%Downside? Your if your function changes it (and you don't know it), this
%can mess up things in your main function. To show this change your code to
%the text below and save it as cent2fahr_v4.m. Then come run this section.

%function TF=cent2fahr_v4(TC)
%%This function will convert temperature in centigrade to fahrenheit
%%Created by NAME on DATE
%%-
%%TC - (input) temperature in centigrade
%%TF - (output) temperature in Fahrenheit
%global scale offset

%TF=TC*scale+offset;
%%I am going to intentionally sabotage the code here...
%scale=NaN;
%%end of function


clc
clear all
global scale offset
scale=9/5;
offset=32;
TF=cent2fahr_v4(10)
scale        %oops, what happened? Notice how the function came in and overrode
             %the value of the variable 'scale.'

%% BLOCK 3.5

%Well, what if you had a bunch of temperature values to convert? You COULD
%write a loop (more on programming structures coming soon...), but that is
%rather amatuerish. Matlab EXCELS at handling things in vector / matrix
%format. What happens if we pass in a vector of values to our function?
%When you run this section, it will call version 3 of our function and it
%will send in a vector of centigrade values....

scale_factor=9/5;
offset_factor=32;
TC=0:100;
TF=cent2fahr_v3(TC,scale_factor,offset_factor);
figure(1)
plot(TC,TF)
xlabel('t (C)'); ylabel('t (F)');

%% BLOCK 3.6

%you can also use 'anonymous' functions. Rather than being saved as
%separate .m files, these functions are written into the text of your main
%script. They still work as functions: you send in values, and different
%values come out. They have some restrictions and are best suited to fairly
%simple operations.

tc=10;
c2f=@(TC) TC*scale_factor+offset_factor;

%ok, so the line above DEFINES the function. c2f is the name. The @(TC) is
%essentially defining the 'input' variable (TC). Then there is a space,
%then there is the actual equation of the function.

TF_anonymous=c2f(tc)

%the line above 'calls' the function by writing the fuction name and
%sending in an argument.

%does this work on vector input?
tc=0:100;
tf=c2f(tc);
figure(2)
plot(tc,tf)
xlabel('t (C)'); ylabel('t (F)');
title('Computed with Anonymous Function')

%% In class exercise (15 min)

%I would like you to write a function that solves the quadratic formula. As
%a reminder, the quadratic formula is:

% ax^2 + bx + c = 0.

%The solutions to the quadratic formula are:
%x1 = [-b + sqrt(b^2 - 4ac)] /2a and x2 = [-b - sqrt(b^2 - 4ac)]

%so your function should accept three arguments (a, b, and c). And, it
%should return two values (x1 and x2). Note, all of the above examples
%returned only one argument, since they were written like:

% function output = functionname(input1, input2, ....., input_n)

% you can generalize this in the following way:

% function [output1, output2] = function(input1, input2, ...)

%Good Luck! When you are done, test out some values to ensure that it is
%working properly. NOTE: Please do not use the 'roots' function to do this.
%I am looking for you to practice basic coding, not leverage higher
%functions.




 