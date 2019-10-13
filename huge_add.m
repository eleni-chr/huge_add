function out = huge_add(a,b)

% The function adds together two positive integers of any length specified
% as character arrays using decimal notation. The output argument is the
% result and it is a character array. The inputs must contain digits only
% (no commas, spaces or any other characters). If any of these assumptions
% are violated by the input, the function returns the number -1. The
% function also works for numbers that are larger than what can be
% represented as a number in MATLAB.

s_a=size(a);
s_b=size(b);
type_a=isstrprop(a,'digit');
type_b=isstrprop(b,'digit');
if ~ischar(a) || ~ischar(b) || sum(type_a)<s_a(2) || sum(type_b)<s_b(2) || str2double(a)<0 || str2double(b)<0 
    out=-1;
    return;
end
if s_a(2)>s_b(2)
    long=s_a(2);
    short=s_b(2);
    difference=long-short;
    b_reverse=reverse(b);
    for i=1:difference
        b_reverse=strcat(b_reverse,'0');
    end
    b_forward=reverse(b_reverse);
    a_forward=a;
else
    long=s_b(2);
    short=s_a(2);
    difference=long-short;
    a_reverse=reverse(a);
    for i=1:difference
        a_reverse=strcat(a_reverse,'0');
    end
    a_forward=reverse(a_reverse);
    b_forward=b;
end
inverted_total='';
hold='';
for i=long:-1:1
    a_digit=str2double(a_forward(i));
    b_digit=str2double(b_forward(i));
    if hold=='1'
        cumsum=a_digit+b_digit+1;
    else
        cumsum=a_digit+b_digit;
    end
    character=num2str(cumsum);
    if length(character)==1
        inverted_total=strcat(inverted_total,character);
        hold='';
    else
        inverted_total=strcat(inverted_total,character(2));
        hold='1';
    end
end
if hold=='1'
    inverted_total=strcat(inverted_total,'1');
end
out=reverse(inverted_total);
end