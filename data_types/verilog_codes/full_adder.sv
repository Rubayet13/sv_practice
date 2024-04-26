module full_adder (input a,
                         b, 
                         cin, 
                  output sum,
                        carry
); 

    wire w1, w2, w3, w4; 

    xor (w1, a, b); 
    xor (sum, w1, cin);
    and (w2,a,b);
    and (w3,b,cin);
    and (w4,cin,a);
    or (carry,w2,w3,w4);
endmodule 

module half_adder(input a, 
                        b, 
                output sum, 
                        carry
);
    assign {carry,sum} = a+b; 
    
endmodule 


module full_adder_1(input a,
                         b, 
                         cin, 
                  output sum,
                        carry
);

    wire w1,w2,w3; 

    xor (sum,a,b,cin);
    xor (w1,a,b);
    and (w3, w1,cin);
    and (w2, a,b);
    or (carry,w2,w3);

endmodule 



module tb; 

    reg a; 
    reg b; 
    reg cin; 
    //wire w1,w2,w3; 
    wire sum, carry; 

    //full_adder f1(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    full_adder_1 f1(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    // half_adder ha1 (.a(a), .b(b), .sum(w1),.carry(w2));
    // half_adder ha2 (.a(cin),.b(w1),.sum(sum), .carry(w3)); //this dot refers to the model half_adder not the module tb variables. 
    // or (carry,w2,w3);
    initial begin 
        $monitor ("[time=%0t] a=%0d, b=%0d, cin=%0d, sum=%0d, carry=%0d", $time, a,b,cin,sum, carry);
        a=1; 
        b=1; 
        cin=1; 
        #1; 
        a=1; 
        b=0; 
        cin=1;        
    end 
endmodule 