//strings can be split into multipe lines [For visual display appeal] by using "" character 
//This does not split the string into multiple lines in the output 
//Result: New York is an awesome place. So energetic and vibrant 

// $display ("bd is good 

// so ener not getic and not vibrant");


// byte myletter = "D";
// bit [7:0] myNewline = "
// ";
// bit [8*17:1] msg = "Hello World"; 
// string msg2 = "Hello World"; 
// each character requires 8 bit 

module tb(); 
    bit [8*11:1] msg = "Hello World"; 

        initial begin 
            $display ("msg = %0s", msg);
        end 
endmodule 
