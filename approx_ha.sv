module approx_ha(

a,
b,
cout,
s
);

input logic a,b;
output logic cout,s;

//assign cout = a & b;
//assign s = a  ^ b;

always @ (*) begin

if(a == 1'b0 & b== 1'b0)
begin
cout= 1'b0;
s=1'b0;

end


if(a == 1'b0 & b== 1'b1)
begin
cout= 1'b0;
s=1'b1;

end


if(a == 1'b1 & b== 1'b0)
begin
cout= 1'b0;
s=1'b1;

end



if(a == 1'b1 & b== 1'b1)
begin
cout= 1'b1;
s=1'b1;

end

end
endmodule
