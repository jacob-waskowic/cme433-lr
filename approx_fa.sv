module approx_fa(
a,
b,
cin,
cout,
s
);




input logic a,b,cin;
output logic cout,s;

always @ (*) begin

if(a == 1'b0 & b== 1'b0 & cin == 1'b0)
begin
cout= 1'b0;
s=1'b0;

end

if(a == 1'b0 & b== 1'b0 & cin == 1'b1)
begin
cout= 1'b0;
s=1'b1;

end


if(a == 1'b0 & b== 1'b1 & cin == 1'b0)
begin
cout= 1'b0;
s=1'b1;

end


if(a == 1'b0 & b== 1'b1 & cin == 1'b1)
begin
cout= 1'b1;
s=1'b0;

end

if(a == 1'b1 & b== 1'b0 & cin == 1'b0)
begin
cout= 1'b0;
s=1'b1;

end

if(a == 1'b1 & b== 1'b0 & cin == 1'b1)
begin
cout= 1'b1;
s=1'b0;

end


if(a == 1'b1 & b== 1'b1 & cin == 1'b0)
begin
cout= 1'b0;
s=1'b1;

end



if(a == 1'b1 & b== 1'b1 & cin == 1'b1)
begin
cout= 1'b1;
s=1'b0;

end


end


endmodule
