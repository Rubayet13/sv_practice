module tb; 
    real pi; 
    real freq; 

    initial begin 
    pi = 3.14; //store floating point number
    freq = 1e6; //store exponential number 

    $display ("value of pi = %f", pi);
    $display ("value of pi = %0.3f", pi);
    $display ("value of freq =%0d", freq);
    end 
    
endmodule 