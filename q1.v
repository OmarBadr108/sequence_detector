module seq_det_q1(x,y,clk,rst,count);
parameter A = 2'b00 ;
parameter B = 2'b01 ;
parameter C = 2'b10 ;
parameter D = 2'b11 ;
input x,clk,rst;
output  y ;
output reg [9:0] count = 0 ;
reg [1:0] ns ,cs ;

//state memory 
always @(posedge clk or negedge rst) begin
	if (rst)
		cs <= A ;
	    count<=0;
		else
		cs <= ns ;
	
end
//next state logic
always @(*) begin
	case (cs)
	A:
		if (~x)
		ns = B ;
		else 
		ns = A ;
	B:
		if (x)
		ns = C ;
		else
		ns = B ;
	C:
		if (~x)
		ns = D ;
		//count = count + 1 ;
		else
		ns = A ;
	D:
		if (x)
		ns = A ;
		else
		ns = B ;
	endcase 
	if (y) count = count +1 ;
end

//output logic 
/*always @(*) begin
	if (y)
		count = count + 1 ;
	else
		count = count ;
end
*/
assign y = (cs==C && ns==D)? 1'b1 : 1'b0 ;
//assign count = (y) ? count +1 : count ;
endmodule 


