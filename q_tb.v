module seq_det_q1_tb ();
reg x,clk,rst ;
wire y ;
wire [9:0] count ;

seq_det_q1 m1 (x,y,clk,rst,count);
integer i ;
	initial begin 
 		clk = 0; 
 		forever 
 		#2 clk = ~clk;
 		
	end

initial begin 
	rst = 1 ;
	#10 ;
	rst = 0 ;
	//count = 0 ;
	#10 ; 
		for(i=0;i<10000;i=i+1)begin 
			@(negedge clk) ;
			x = $random ;
		end 
		$stop;
end 
endmodule 
