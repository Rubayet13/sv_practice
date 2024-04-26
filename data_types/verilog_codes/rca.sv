module full_adder (a, b, cin, sum, carry);
    input a, b, cin;
    output sum, carry;

    //assign {sum, carry} = {(a ^ b ^ cin), ((a ^ b) & cin) | (a & b)};
    //assign {carry, sum} = a+b+cin;

    assign sum = a ^ b ^ cin;
    assign carry = (a & b)|(b & cin)|(cin & a);
endmodule


module ripple_carry_adder (x,y,cin,sum,c_out);
        input [3:0] x,y;
        input cin;  
        output [3:0] sum; 
        output c_out; 

        wire w1,w2,w3;

        full_adder f1 (x[0], y[0], cin, sum[0],w1);
        full_adder f2 (x[1], y[1], w1, sum [1], w2); // if we would connect like this (.a(x[0]), .b(y[0]),......), we could have done that, in that case the dot will have refer to the full_adder  model
        full_adder f3 (x[2], y[2], w2, sum [2], w3); 
        full_adder f4 (x[3], y[3], w3, sum [3], c_out);
endmodule 

module tb(); 
    reg [3:0] x; 
    reg [3:0] y; 
    reg cin ; 
    
    wire [3:0] s; 
    wire c_out; 

    ripple_carry_adder rca (.x(x), .y(y), .cin(cin), .sum(s), .c_out(c_out));

    initial begin 
        $monitor ("At time %0t x=[%0b], y=[%0b], cin=[%0b], s=[%0b], c_out=[%0b]", $time, x, y, cin, s, c_out);
            cin = 1;
            x = 4'b0110;
            y = 4'b1100;
            #10
            x = 4'b1110;
            y = 4'b1000;
            #10
            x = 4'b0111;
            y = 4'b1110;
            #10
            x = 4'b0010;
            y = 4'b1001;
            #10
            $finish();
    end 

    initial begin 
            $dumpfile("waves.vcd");
            $dumpvars;
    end 
endmodule 