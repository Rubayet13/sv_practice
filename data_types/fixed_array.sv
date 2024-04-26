module tb; 

int myFIFO [0:7];
int urFIFO [8];

logic [0:2][0:3][0:5] myArray [5]; // single value is not allowed in packed dimension like logic [2][2][2] my array [4]
                                    //for packed no issue

    initial begin 
        myFIFO[5]=32'hface_cafe; 

        // Initialize all elements of myArray to 0
        myArray = '{default: 0};
        myArray [0][1] =2; 
        myArray [1][2] =7; 
        myArray [1][2][3][4] =7; 
        myArray [1][1][2][1] =7; 
        myArray [1][2][2][1] =7; 
        myArray [1][2][1][3] =7; 
        myArray [1][2][1][5] =7; 
    // Display contents of myArray
        for (int i = 0; i < 5; i++) begin
            $display("myArray[%0d]= %0d", i, myArray[i]);
            for (int j = 0; j <= 2; j++) begin
                $display("myArray[%0d][%0d]= %0d", i, j, myArray[i][j]);
                for (int k = 0; k <= 3; k++) begin
                    $display("myArray[%0d][%0d][%0d]= %0d", i, j,k, myArray[i][j][k]);
                    for (int m = 0; m <= 5; m++) begin
                        $display("myArray[%0d][%0d][%0d][%0d]= %0d", i, j, k, m, myArray[i][j][k][m]);
                    end
                end
            end
        end
         $display("myArray[1][1][1][1]= %0d", myArray[1][1][1][1]);
    end
    
//      foreach (myArray[i]) begin
//          foreach (myArray[i][j]) begin
//              foreach (myArray[i][j][k]) begin
//                     foreach (myArray[i][j][k][m]) begin
//                          $display ("myArray [%0d][%0d][%0d][%0d]= %0d", i , j, k, m, myArray[i][j][k][m]);
//               end
//             end
//           end
//         end
//       end

endmodule 

